import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

typedef S = int;

@freezed
sealed class A with _$A {
  const factory increment() = _Increment;
  const factory decrement() = _Decrement;
}

class M() extends Cms<S, A> {
  this : super(0);
  @override
  S kernel(S s, A a) => switch (a) {
    _Increment _ => s + 1,
    _Decrement _ => s - 1,
  };
}
