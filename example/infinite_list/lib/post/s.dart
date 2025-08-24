import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/post.dart';

part 's.freezed.dart';

@freezed
sealed class S with _$S {
  const factory S.zero([@Default([]) List<Post> posts]) = Zero;
  const factory S.loaded(List<Post> posts) = Loaded;
  const factory S.done(List<Post> posts) = Done;
  const factory S.failed(String message) = Failed;
}
