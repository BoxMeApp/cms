import 'dart:async';

import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

const _duration = 60;

@freezed
sealed class S with _$S {
  const factory S.zero(int duration) = Zero;
  const factory S.paused(int duration, StreamSubscription<int> clock) = Paused;
  const factory S.running(int duration, StreamSubscription<int> clock) =
      Running;
  const factory S.completed(int duration) = Completed;
}

@freezed
sealed class A with _$A {
  const factory A.start() = _Start;
  const factory A.pause() = _Pause;
  const factory A.resume() = _Resume;
  const factory A.reset() = _Reset;
  const factory A._tick(int duration) = _Tick;
}

class M extends Cms<S, A> {
  final Ticker _ticker;
  M(this._ticker) : super(const Zero(_duration));

  // dart format off
  @override
  S? kernel(S s, A a) => switch ((s, a)) {
    (Zero      s, _Start  a) => () {
                                  final clock = _ticker
                                      .tick(ticks: _duration)
                                      .listen((t) => add(_Tick(t)));
                                  return Running(s.duration, clock);
                                }(),
    (Running   s, _Pause  a) => () {
                                  s.clock.pause();
                                  return Paused(s.duration, s.clock);
                                }(),
    (Paused    s, _Resume a) => () {
                                  s.clock.resume();
                                  return Running(s.duration, s.clock);
                                }(),
    (Paused    s, _Reset  a) => () {
                                  final clock = s.clock;      
                                  clock.cancel();
                                  return const Zero(_duration);
                                }(),
    (Running   s, _Reset  a) => kernel(Paused(s.duration, s.clock), a),
    (Completed s, _Reset  a) => const Zero(_duration),
    (Running   s, _Tick   a) => () {
                                  final duration = a.duration;
                                  final clock = s.clock;
                                  if (duration > 0) {
                                    return Running(duration, clock);
                                  } else {
                                    clock.cancel();
                                    return const Completed(0);
                                  }
                                }(),
    _                        => undefined(s, a),
  };
  // dart format on
}

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
