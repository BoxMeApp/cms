import 'dart:async';

import 'package:cms/cms.dart';
import 'package:test/test.dart';

void main() {
  /// close 取消 emitter 而非底层 Future：无需额外停止信号，迟到的 kernel 结果不会发出。
  test(
    'Closing completes before pending work and ignores its late state',
    () async {
      // dart format off
    final operation = PendingOperation();
    final cms = CloseProbe(operation);
    addTearDown(() async {
      operation.complete(42);
      await cms.close();
    });
    final states = <int>[];
    final subscription = cms.stream.listen(states.add);
    addTearDown(subscription.cancel);
    final streamClosed = expectLater(cms.stream, emitsDone);
    cms.add(.execute);
    await operation.started;                       expect(operation.isCompleted, isFalse);
    await cms.close();
    await streamClosed;                            expect(cms.isClosed, isTrue);
                                                   expect(operation.isCompleted, isFalse);
                                                   expect(states, isEmpty);
    operation.complete(42);
    await operation.finished;
    await Future<void>.delayed(.zero);              expect(operation.result, 42);
                                                   expect(cms.state, 0);
                                                   expect(states, isEmpty);
    // dart format on
    },
  );
}

enum Action { execute }

class CloseProbe(final PendingOperation operation) extends Cms<int, Action> {
  this : super(0);

  // dart format off
  @override
  Future<int?> kernel(int s, Action a) => switch ((s, a)) {
    (_, Action.execute) => operation.run(),
  };
  // dart format on
}

class PendingOperation {
  final _started = Completer<void>();
  final _pending = Completer<int>();
  final _finished = Completer<void>();
  int? result;

  Future<void> get started => _started.future;
  Future<void> get finished => _finished.future;
  bool get isCompleted => _finished.isCompleted;

  Future<int> run() async {
    _started.complete();
    final value = await _pending.future;
    result = value;
    _finished.complete();
    return value;
  }

  void complete(int value) {
    if (!_pending.isCompleted) _pending.complete(value);
  }
}
