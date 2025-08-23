import 'package:freezed_annotation/freezed_annotation.dart';

part 'a.freezed.dart';

@freezed
sealed class A with _$A {
  const factory A.pop() = Pop;
  const factory A.fetchNote([int? id]) = FetchNote;
  const factory A.newContent(String content) = NewContent;
}
