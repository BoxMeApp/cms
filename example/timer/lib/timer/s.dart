import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 's.freezed.dart';

@freezed
sealed class S with _$S {
  const factory S.zero(int duration) = Zero;
  const factory S.paused(int duration, StreamSubscription<int> clock) = Paused;
  const factory S.running(int duration, StreamSubscription<int> clock) =
      Running;
  const factory S.completed(int duration) = Completed;
}
