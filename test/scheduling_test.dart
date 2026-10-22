import 'dart:async';

import 'package:cms/cms.dart';
import 'package:test/test.dart';

EventTransformer<E> serial<E>() => (events, mapper) => events.asyncExpand(mapper);

void main() {
  /// 父事件与子事件同时配置 pace 时，同一个子事件会执行两次 kernel。
  test('Overlapping parent and child pace registrations handle an event twice', () async {
    final cms = OverlapProbe();
    addTearDown(cms.close);
    // dart format off
    cms.add(const Child());
    await cms.handledTwice.future;                                              expect(cms.calls, 2);
    // dart format on
  });

  /// 全局串行时，长期 forward 占用队列，源数据对应的事件只能在源流结束后处理。
  test('Global serial forwarding delays data events until the source closes', () async {
    final cms = SerialForwardProbe();
    addTearDown(() async { await cms.source.close(); await cms.close(); });
    // dart format off
    cms.add(const Watch());
    await cms.listening.future;
    cms.source.add(7);
    await cms.forwarded.future;                                                 expect(cms.state, 0);
    final received = cms.stream.firstWhere((value) => value == 7);
    cms.sourceClosing = true;
    await cms.source.close();
    await received;                                                             expect(cms.state, 7);
                                                                                expect(cms.processedAfterSourceClosing, isTrue);
    // dart format on
  });
}

sealed class Action { const Action(); }
class Parent extends Action { const Parent(); }
class Child extends Parent { const Child(); }
class Watch extends Action { const Watch(); }
class Data extends Action {
  const Data(this.value);
  final int value;
}

class OverlapProbe extends Cms<int, Action> {
  OverlapProbe() : super(0) {
    pace<Parent>(serial());
    pace<Child>(serial());
  }
  int calls = 0;
  final handledTwice = Completer<void>();

  // dart format off
  @override
  int? kernel(int s, Action a) => switch ((s, a)) {
    (int s, Child a) => () {
                          calls++;
                          if (calls == 2) handledTwice.complete();
                          return s + 1;
                        }(),
    _               => undefined(s, a),
  };
  // dart format on
}

class SerialForwardProbe extends Cms<int, Action> {
  SerialForwardProbe() : super(0, serial()) {
    source = StreamController<int>(onListen: listening.complete);
  }
  late final StreamController<int> source;
  final listening = Completer<void>();
  final forwarded = Completer<void>();
  bool sourceClosing = false;
  bool processedAfterSourceClosing = false;

  // dart format off
  @override
  FutureOr<int?> kernel(int s, Action a) => switch ((s, a)) {
    (int s, Watch a) => () async {
                          await forward(source.stream, (value) {
                            forwarded.complete();
                            return Data(value);
                          });
                          return null;
                        }(),
    (int s, Data  a) => () {
                          processedAfterSourceClosing = sourceClosing;
                          return a.value;
                        }(),
    _               => undefined(s, a),
  };
  // dart format on
}
