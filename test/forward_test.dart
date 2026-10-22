import 'dart:async';

import 'package:cms/cms.dart';
import 'package:test/test.dart';

void main() {
  /// 没有其他事件覆盖绑定时，挂起后启动的转发仍能收到源数据。
  test('Forwarding receives source data without an overlapping event',
      () async {
    final cms = ForwardProbe();
    addTearDown(cms.dispose);
    // dart format off
    cms.add(const Watch());
    await cms.watchStarted.future;
    cms.resumeWatch.complete();
    await cms.sourceListened.future;
    final received = cms.stream.firstWhere((value) => value == 7);
    cms.source.add(7);
    await received;                                                            expect(cms.state, 7);
                                                                                expect(cms.sourceCancelled.isCompleted, isFalse);
    await cms.source.close();
    await cms.watchDone.future;                                                 expect(cms.sourceCancelled.isCompleted, isTrue);
    // dart format on
  });

  // Before the fix (time flows downward):
  //
  // Watch                       Other                       Shared _forward
  //   |                           |                               |
  //   |-- handler starts ---------------------------------------> emitWatch
  //   |-- await resumeWatch       |                               |
  //   |   (not subscribed yet)    |                               |
  //   |                           |-- handler starts -----------> emitOther
  //   |                           |-- done; emitOther completes   |
  //   |-- resume; call forward ---------------------------------> emitOther
  //   |<-- new subscription is cancelled immediately              |
  //   |-- source sends 7; no Data(7) is produced                   |
  //
  // Other 覆盖的是共享的转发函数绑定，不是取消 Watch 事件，
  // 也不是中断一条已经建立的 Watch 订阅。
  //
  // After the fix (time flows downward):
  //
  // Watch / Zone W              Other / Zone O
  //   |                           |
  //   |-- bind emitWatch          |
  //   |-- await resumeWatch       |
  //   |                           |-- bind emitOther
  //   |                           |-- done; Zone W is unaffected
  //   |-- resume; use emitWatch   |
  //   |<-- source sends 7         |
  //   |-- add(Data(7)); state = 7 |
  //   |-- source closes; subscription ends normally
  //
  /// 另一事件结束后，Watch 的转发仍属于自身，必须收到源流中的 7。
  test('Forwarding keeps its own emitter after an overlapping event completes', () async {
    final cms = ForwardProbe();
    addTearDown(cms.dispose);
    // dart format off
    cms.add(const Watch());
    await cms.watchStarted.future;
    cms.add(const Other());
    await cms.otherDone.future;
    final outcome = Future.any<Object>([
      cms.stream.firstWhere((value) => value == 7),
      cms.sourceCancelled.future.then((_) => 'cancelled'),
    ]);
    cms.resumeWatch.complete();
    await cms.sourceListened.future;
    cms.source.add(7);
    final result = await outcome;                                              expect(result, 7);
                                                                                expect(cms.state, 7);
                                                                                expect(cms.received, [7]);
                                                                                expect(cms.sourceCancelled.isCompleted, isFalse);
    await cms.source.close();
    await cms.watchDone.future;                                                 expect(cms.sourceCancelled.isCompleted, isTrue);
    // dart format on
  });
}

sealed class Action {
  const Action();
}

class Watch extends Action {
  const Watch();
}

class Other extends Action {
  const Other();
}

class Data extends Action {
  const Data(this.value);
  final int value;
}

class ForwardProbe extends Cms<int, Action> {
  ForwardProbe() : super(0) {
    source = StreamController<int>(
      onListen: sourceListened.complete,
      onCancel: sourceCancelled.complete,
    );
  }

  late final StreamController<int> source;
  final watchStarted = Completer<void>();
  final resumeWatch = Completer<void>();
  final sourceListened = Completer<void>();
  final sourceCancelled = Completer<void>();
  final otherDone = Completer<void>();
  final watchDone = Completer<void>();
  final received = <int>[];

  // dart format off
  @override
  FutureOr<int?> kernel(int s, Action a) => switch ((s, a)) {
    (int s, Watch a) => () async {
                          watchStarted.complete();
                          await resumeWatch.future;
                          await forward(source.stream, (value) {
                            received.add(value);
                            return Data(value);
                          });
                          return null;
                        }(),
    (int s, Other a) => null,
    (int s, Data  a) => a.value,
  };
  // dart format on

  @override
  void onDone(Action event, [Object? error, StackTrace? stackTrace]) {
    super.onDone(event, error, stackTrace);
    if (event is Other) otherDone.complete();
    if (event is Watch) watchDone.complete();
  }

  Future<void> dispose() async {
    if (!resumeWatch.isCompleted) resumeWatch.complete();
    // 确保转发订阅已建立后再关闭源，避免清理挂起。
    await sourceListened.future;
    await source.close();
    await close();
  }
}
