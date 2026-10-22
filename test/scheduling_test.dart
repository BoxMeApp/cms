import 'dart:async';

import 'package:cms/cms.dart';
import 'package:test/test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheduling_test.freezed.dart';

EventTransformer<E> serial<E>() =>
    (events, mapper) => events.asyncExpand(mapper);

void main() {
  /// 父事件与子事件同时配置 pace 时，同一个子事件会执行两次 kernel。
  test(
    'Overlapping parent and child pace registrations handle an event twice',
    () async {
      final controller = CounterController();
      final cms = OverlapProbe(controller);
      addTearDown(cms.close);
      // dart format off
      cms.add(const .child());
      await Future.delayed(.zero);  expect(controller.calls, 2);
      await cms.close();
      // dart format on
    },
  );

  // Watch.forward holds the serial queue -> Data(7) waits -> source closes -> state = 7
  /// 全局串行时，长期 forward 占用队列，源数据对应的事件只能在源流结束后处理。
  test(
    'Global serial forwarding delays data events until the source closes',
    () async {
      final controller = SourceController();
      final cms = SerialForwardProbe(controller);
      addTearDown(() async {
        await controller.close();
        await cms.close();
      });
      // dart format off
      cms.add(const .watch());
      await Future.delayed(.zero);  expect(controller.isListening, isTrue);
                                    final states = expectLater(cms.stream, emitsInOrder([7, emitsDone]));
      controller.add(7);
      await Future.delayed(.zero);  expect(cms.state, 0);
      await controller.close();
      await cms.close();
                                    await states;
                                    expect(cms.state, 7);
      // dart format on
    },
  );
}

// 类型标记保留父子类型重叠条件，验证 pace 的运行时类型匹配。
abstract interface class Parent implements Action {}

@freezed
sealed class Action with _$Action {
  @Implements<Parent>()
  const factory child() = _Child;
  const factory watch() = _Watch;
  const factory data(int value) = _Data;
}

class OverlapProbe(final CounterController controller)
    extends Cms<int, Action> {
  this : super(0) {
    pace<Parent>(serial());
    pace<_Child>(serial());
  }

  // dart format off
  @override
  int? kernel(int s, Action a) => switch ((s, a)) {
    (int s, _Child a) => () {
                          controller.increment();
                          return s + 1;
                        }(),
    _                => undefined(s, a),
  };
  // dart format on
}

class SerialForwardProbe(final SourceController controller)
    extends Cms<int, Action> {
  this : super(0, serial());

  // dart format off
  @override
  FutureOr<int?> kernel(int s, Action a) => switch ((s, a)) {
    (int s, _Watch a) => () async {
                          await forward(controller.stream, (value) => .data(value));
                          return null;
                        }(),
    (int s, _Data  a) => a.value,
    _                => undefined(s, a),
  };
  // dart format on
}

class CounterController {
  int _calls = 0;
  int get calls => _calls;
  void increment() => _calls++;
}

class SourceController {
  final _source = StreamController<int>();
  Stream<int> get stream => _source.stream;
  bool get isListening => _source.hasListener;
  void add(int value) => _source.add(value);
  Future<void> close() => _source.close();
}
