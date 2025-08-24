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

  @override
  S? kernel(S s, A a) => switch ((s, a)) {
    (Zero(:final duration), Start()) => () {
      final subscription = _ticker
          .tick(ticks: _duration)
          .listen((duration) => add(Tick(duration)));
      return Running(duration, subscription);
    }(),
    (Running(:final duration, :final subscription), Pause()) => () {
      subscription.pause();
      return Paused(duration, subscription);
    }(),
    (Paused(:final duration, :final subscription), Resume()) => () {
      subscription.resume();
      return Running(duration, subscription);
    }(),
    (Paused(:final subscription) || Running(:final subscription), Reset()) =>
      () {
        subscription.cancel();
        return const Zero(_duration);
      }(),
    (Completed(), Reset()) => const Zero(_duration),
    (Running(:final subscription), Tick(:final duration)) => () {
      if (duration > 0) {
        return Running(duration, subscription);
      } else {
        subscription.cancel();
        return const Completed(0);
      }
    }(),
    _ => throw StateError('algebric error: $s -- $a -->'),
  };
}
