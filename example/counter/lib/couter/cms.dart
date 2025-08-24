import 'dart:async';

import 'package:cms/cms.dart';

import 'a.dart';

export 'a.dart';

class M extends Cms<int, A> {
  M() : super(0);

  @override
  FutureOr<int?> kernel(
    int s,
    A a,
    void Function(A p1) dispatch,
    Relay<A> relay,
  ) => switch (a) {
    Increment() => s + 1,
    Decrement() => s - 1,
  };
}
