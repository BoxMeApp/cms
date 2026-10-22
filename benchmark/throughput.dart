import 'dart:async';
import 'dart:io';

import 'package:cms/cms.dart';

EventTransformer<E> serial<E>() =>
    (events, mapper) => events.asyncExpand(mapper);

class KernelProbe(final bool asynchronous) extends Cms<int, int> {
  this : super(0, serial());

  @override
  FutureOr<int?> kernel(int s, int a) => asynchronous ? Future.value(a) : a;
}

class BlocProbe(final bool asynchronous) extends Bloc<int, int> {
  this : super(0) {
    on<int>((event, emit) async {
      final value = asynchronous ? await Future.value(event) : event;
      emit(value);
    }, transformer: serial());
  }
}

// Measure enqueueing and processing, excluding construction and cleanup.
// Every emitted value must match its input; dropped or reordered work fails.
Future<double> measure(Bloc<int, int> bloc, int count) async {
  final completed = Completer<void>();
  var received = 0;
  final subscription = bloc.stream.listen(
    (value) {
      received++;
      if (value != received && !completed.isCompleted) {
        completed.completeError(
          StateError('Expected $received, received $value'),
        );
      }
      if (received == count && !completed.isCompleted) completed.complete();
    },
    onError: (Object error, StackTrace stack) {
      if (!completed.isCompleted) completed.completeError(error, stack);
    },
  );
  final stopwatch = Stopwatch()..start();
  try {
    for (var event = 1; event <= count; event++) {
      bloc.add(event);
    }
    await completed.future.timeout(const Duration(seconds: 30));
    stopwatch.stop();
    if (received != count || bloc.state != count) {
      throw StateError('Incomplete processing: $received/$count');
    }
    return stopwatch.elapsedMicroseconds / count;
  } finally {
    await subscription.cancel();
    await bloc.close();
  }
}

double median(List<double> values) {
  final sorted = [...values]..sort();
  return sorted[sorted.length ~/ 2];
}

Future<void> main() async {
  const count = 20000;
  const warmups = 3;
  const rounds = 9;
  stdout.writeln('Dart ${Platform.version.split('\n').first}');
  stdout.writeln(
    '$count events/sample; $warmups warmups; $rounds measured rounds',
  );
  stdout.writeln(
    'Sequential scheduling; enqueue + processing; median us/event',
  );
  for (final asynchronous in [false, true]) {
    final cms = <double>[];
    final bloc = <double>[];
    for (var round = -warmups; round < rounds; round++) {
      late double cmsTime;
      late double blocTime;
      // Alternate execution order to reduce systematic order bias.
      if (round.isEven) {
        cmsTime = await measure(KernelProbe(asynchronous), count);
        blocTime = await measure(BlocProbe(asynchronous), count);
      } else {
        blocTime = await measure(BlocProbe(asynchronous), count);
        cmsTime = await measure(KernelProbe(asynchronous), count);
      }
      if (round >= 0) {
        cms.add(cmsTime);
        bloc.add(blocTime);
      }
    }
    final cmsMedian = median(cms);
    final blocMedian = median(bloc);
    stdout.writeln(
      '${asynchronous ? 'Async' : 'Sync'}: '
      'CMS ${cmsMedian.toStringAsFixed(3)}, '
      'Bloc ${blocMedian.toStringAsFixed(3)}, '
      'ratio ${(cmsMedian / blocMedian).toStringAsFixed(2)}x',
    );
    stdout.writeln(
      '  CMS samples: ${cms.map((v) => v.toStringAsFixed(3)).join(', ')}',
    );
    stdout.writeln(
      '  Bloc samples: ${bloc.map((v) => v.toStringAsFixed(3)).join(', ')}',
    );
  }
}
