import 'dart:async';

import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/test.dart';

part 'channel_test.freezed.dart';

EventTransformer<E> serial<E>() => (events, mapper) => events.asyncExpand(mapper);

void main() {
  late WorkController controller;
  late ChannelProbe cms;
  setUp(() {
    controller = WorkController();
    cms = ChannelProbe(controller);
  });
  tearDown(() async {
    controller.completeAll();
    await cms.close();
  });

  /// 默认串行策略按事件类型独立应用，等待中的 Slow 不应阻塞 Quick。
  test('Default serial scheduling isolates different event types', () async {
    // dart format off
    cms.add(const .slow(1));
    await Future.delayed(.zero);  expect(controller.started, [1]);
    cms.add(const .quick());
    await Future.delayed(.zero);  expect(controller.quickCalls, 1);
    // dart format on
  });

  /// 同一种事件仍使用同一串行通道，前一次完成前不能开始下一次。
  test('Default serial scheduling preserves order within an event type', () async {
    // dart format off
    cms.add(const .slow(1));
    cms.add(const .slow(2));
    await Future.delayed(.zero);  expect(controller.started, [1]);
                                  controller.complete(1);
                                  await Future.delayed(.zero);
                                  expect(controller.started, [1, 2]);
    // dart format on
  });
}

@freezed
sealed class Action with _$Action {
  const factory slow(int id) = _Slow;
  const factory quick() = _Quick;
}

class ChannelProbe(final WorkController controller) extends Cms<int, Action> {
  this : super(0, serial());

  // dart format off
  @override
  FutureOr<int?> kernel(int s, Action a) => switch ((s, a)) {
    (int s, _Slow  a) => () async {
                          await controller.work(a.id);
                          return null;
                        }(),
    (int s, _Quick a) => () {
                          controller.quick();
                          return null;
                        }(),
  };
  // dart format on
}

class WorkController {
  final started = <int>[];
  final _gates = <int, Completer<void>>{};
  int quickCalls = 0;
  bool _closing = false;

  Future<void> work(int id) {
    started.add(id);
    if (_closing) return Future.value();
    return (_gates[id] = Completer<void>()).future;
  }

  void quick() => quickCalls++;
  void complete(int id) {
    final gate = _gates[id];
    if (gate != null && !gate.isCompleted) gate.complete();
  }

  void completeAll() {
    _closing = true;
    for (final id in _gates.keys) { complete(id); }
  }
}
