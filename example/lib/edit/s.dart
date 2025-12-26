import 'package:freezed_annotation/freezed_annotation.dart';

part 's.freezed.dart';

@freezed
abstract class StickyNote with _$StickyNote {
  const factory StickyNote({
    required int id,
    required String content,
    required DateTime createdAt,
  }) = _StickyNote;
}

@freezed
sealed class S with _$S {
  const factory S.zero() = Zero;
  const factory S.editing(StickyNote note) = Editing;
  const factory S.done(StickyNote note) = Done;
  const factory S.failure(String message) = Failure;
}
