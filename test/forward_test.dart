import 'dart:async';

import 'package:cms/cms.dart';
import 'package:test/test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forward_test.freezed.dart';

void main() {
  late WatchController controller;
  late ForwardProbe cms;

  setUp(() {
    controller = WatchController();
    cms = ForwardProbe(controller);
  });
  tearDown(() async {
    await controller.dispose();
    await cms.close();
  });

  /// 没有其他事件覆盖绑定时，挂起后启动的转发仍能收到源数据。
  test(
    'Forwarding receives source data without an overlapping event',
    () async {
      // dart format off
      cms.add(const .watch());
      await Future.delayed(.zero);      expect(controller.isInitStarted, isTrue);
                                        // 完成初始化，让 Watch 开始转发
                                        controller.completeInit();
                                        await Future.delayed(.zero);
                                        expect(controller.isListening, isTrue);
                                        expect(controller.isCancelled, isFalse);
                                        final states = expectLater(cms.stream, emitsInOrder([7, emitsDone]));
      controller.add(7);
      await controller.close();
      await cms.close();                expect(controller.isCancelled, isTrue);
                                        await states;                    
                                        expect(cms.state, 7);
      // dart format on
    },
  );

  // Watch.init pending -> Other.done -> Watch.forward
  // Before: shared binding -> emitOther (done) -> cancelled
  // After:  Watch's Zone   -> emitWatch        -> receives 7
  //
  /// 另一事件结束后，Watch 的转发仍属于自身，必须收到源流中的 7。
  test(
    'Forwarding keeps its own emitter after an overlapping event completes',
    () async {
      // dart format off
      cms.add(const .watch());
      await Future.delayed(.zero);      expect(controller.isInitStarted, isTrue);
      cms.add(const .other());
                                        await Future.delayed(.zero);
                                        // 初始化的过程中插入其他事件
                                        controller.completeInit();
                                        await controller.listening;
                                        expect(controller.isListening, isTrue);
                                        expect(controller.isCancelled, isFalse);
                                        final states = expectLater(cms.stream, emitsInOrder([7, emitsDone]));
      controller.add(7);
      await controller.close();
      await cms.close();                expect(controller.isCancelled, isTrue);
                                        await states;
                                        expect(cms.state, 7);
      // dart format on
    },
  );
}

@freezed
sealed class Action with _$Action {
  const factory watch() = _Watch;
  const factory other() = _Other;
  const factory data(int value) = _Data;
}

class ForwardProbe(final WatchController controller) extends Cms<int, Action> {
  this : super(0);

  // dart format off
  @override
  FutureOr<int?> kernel(int s, Action a) => switch ((s, a)) {
    (int s, _Watch a) => () async {
                          await controller.init();
                          await forward(controller.stream, (value) => .data(value));
                          return null;
                        }(),
    (int s, _Other a) => null,
    (int s, _Data  a) => a.value,
  };
  // dart format on


}

// 流源及阶段信号通过依赖注入提供，CMS 不负责测试的同步与清理。
class WatchController() {
  this {
    _source = StreamController<int>(
      onListen: _listening.complete,
      onCancel: () => _isCancelled = true,
    );
  }

  late final StreamController<int> _source;
  bool _isInitStarted = false;
  final _initCompleted = Completer<void>();
  final _listening = Completer<void>();
  bool _isCancelled = false;

  bool get isInitStarted => _isInitStarted;
  Future<void> get listening => _listening.future;
  bool get isListening => _source.hasListener;
  bool get isCancelled => _isCancelled;

  Stream<int> get stream => _source.stream;

  Future<void> init() {
    _isInitStarted = true;
    return _initCompleted.future;
  }

  void completeInit() {
    if (!_initCompleted.isCompleted) _initCompleted.complete();
  }

  void add(int value) => _source.add(value);
  Future<void> close() => _source.close();


  Future<void> dispose() async {
    completeInit();
    // 初始化已开始时，等待它完成并建立订阅，再关闭源以避免清理挂起。
    if (_isInitStarted) await _listening.future;
    await close();
  }
}
