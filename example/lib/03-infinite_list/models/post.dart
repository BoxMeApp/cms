import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory({
    required int id,
    required String title,
    required String body,
  }) = _Post;

  factory fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
