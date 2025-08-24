import 'package:freezed_annotation/freezed_annotation.dart';

part 'a.freezed.dart';

@freezed
sealed class A with _$A {
  const factory A.increment() = Increment;
  const factory A.decrement() = Decrement;
}
