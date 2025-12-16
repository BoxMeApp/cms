import 'package:cms/cms.dart';
import 'package:timer/ticker.dart';

import 'a.dart';
import 's.dart';

export 's.dart';
export 'a.dart';

const _duration = 60;

class M extends Cms<S, A> {
  final Ticker _ticker;
  M(this._ticker) : super(const Zero(_duration));

  // dart format off
  @override
  S? kernel(S s, A a) => switch ((s, a)) {
    (Zero s                 , Start  _) =>  () {
                                              final clock = _ticker
                                                  .tick(ticks: _duration)
                                                  .listen((t) => add(Tick(t)));
                                              return Running(s.duration, clock);
                                            }(),
    (Running s              , Pause  _) =>  () {
                                              s.clock.pause();
                                              return Paused(s.duration, s.clock);
                                            }(),
    (Paused s               , Resume _) =>  () {
                                              s.clock.resume();
                                              return Running(s.duration, s.clock);
                                            }(),
    (Paused(:final clock) 
    || Running(:final clock), Reset  _) =>  () {
                                              clock.cancel();
                                              return const Zero(_duration);
                                            }(),
    (Completed()            , Reset  _) =>  const Zero(_duration),
    (Running s              , Tick   a) =>  () {
                                              final duration = a.duration;
                                              final clock = s.clock;
                                              if (duration > 0) {
                                                return Running(duration, clock);
                                              } else {
                                                clock.cancel();
                                                return const Completed(0);
                                              }
                                            }(),
    _                                   => throw StateError('algebric error: $s -- $a -->'),
  };
  // dart format on
}
