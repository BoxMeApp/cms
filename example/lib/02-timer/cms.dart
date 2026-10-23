import 'dart:async';

import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

const _duration = 60;

@freezed
sealed class S with _$S {
  const factory zero(int duration) = Zero;
  const factory paused(int duration, StreamSubscription<int> clock) = Paused;
  const factory running(int duration, StreamSubscription<int> clock) = Running;
  const factory completed(int duration) = Completed;
}

@freezed
sealed class A with _$A {
  const factory start() = _Start;
  const factory pause() = _Pause;
  const factory resume() = _Resume;
  const factory reset() = _Reset;
  const factory _tick(int duration) = _Tick;
}

class M(final Ticker _ticker) extends Cms<S, A> {
  this : super(const .zero(_duration));

  // dart format off
  @override
  S? kernel(S s, A a) => switch ((s, a)) {
    (Zero      s, _Start  _) => () {
                                  final clock = _ticker
                                      .tick(ticks: _duration)
                                      .listen((t) => add(._tick(t)));
                                  return Running(s.duration, clock);
                                }(),
    (Running   s, _Pause  _) => () {
                                  s.clock.pause();
                                  return Paused(s.duration, s.clock);
                                }(),
    (Paused    s, _Resume _) => () {
                                  s.clock.resume();
                                  return Running(s.duration, s.clock);
                                }(),
    (Paused    s, _Reset  _) => () {
                                  final clock = s.clock;      
                                  clock.cancel();
                                  return const Zero(_duration);
                                }(),
    (Running   s, _Reset  a) => kernel(Paused(s.duration, s.clock), a),
    (Completed _, _Reset  _) => const Zero(_duration),
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

class const Ticker() {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      const .new(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
