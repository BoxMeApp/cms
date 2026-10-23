import 'package:cms/cms.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

class M() extends Cms<S, A> {
  this : super(const .zero());

  @override
  S kernel(S s, A a) => switch ((s, a)) {
    _ => undefined(s, a),
  };

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is CmsError) {
      print(error);
      print(stackTrace);
    }
    super.onError(error, stackTrace);
  }
}

@freezed
sealed class S with _$S {
  const factory zero() = Zero;
}

@freezed
sealed class A with _$A {
  const factory trigger() = _Trigger;
}
