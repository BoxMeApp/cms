import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cms/cms.dart';
import 'package:test/test.dart';

/**
 * 这么看，Cms 和 Bloc:
 * 
 * emit add, 与 add emit 是一样，都是会出现竞态问题
 */

void main() {
  group('cms delegate', () {
    blocTest(
      'case 1',
      build: () => M(),
      act: (cms) => cms.add(const Fetch()),
      expect: () => [S(0, 1), S(1, 1)],
    );

    blocTest(
      "case 2",
      build: () => M(),
      act: (cms) => cms
        ..add(const Fetch())
        ..add(const Fetch()),
      expect: () => [S(0, 1), S(0, 2), S(1, 2), S(2, 2)],
    );
  });

  group('bloc delegate', () {
    blocTest(
      'case 1',
      build: () => B(),
      act: (bloc) => bloc.add(const Fetch()),
      expect: () => [S(0, 1), S(1, 1)],
    );

    blocTest(
      "case 2",
      build: () => B$(),
      act: (bloc) => bloc
        ..add(const Fetch())
        ..add(const Fetch()),
      expect: () => [S(0, 1), S(1, 1), S(1, 2), S(2, 2)],
    );

    blocTest(
      "case 2'",
      build: () => B(),
      act: (bloc) => bloc
        ..add(const Fetch())
        ..add(const Fetch()),
      expect: () => [S(0, 1), S(0, 2), S(1, 2), S(2, 2)],
    );
  });
}

sealed class E {
  const E();
}

class Fetch extends E {
  const Fetch();
}

class _RealFetch extends E {
  const _RealFetch();
}

class S {
  final int data;
  final int loading;
  const S(this.data, [this.loading = 0]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is S && data == other.data && loading == other.loading;

  @override
  int get hashCode => Object.hash(data, loading);

  @override
  String toString() => 'S(data: $data, loading: $loading)';
}

class M extends Cms<S, E> {
  M() : super(S(0));

  @override
  FutureOr<S?> kernel(S s, E a) => switch (a) {
    Fetch _ => () {
      add(_RealFetch());
      return S(s.data, s.loading + 1);
    }(),
    _RealFetch _ => S(s.data + 1, s.loading),
  };
}

class B extends Bloc<E, S> {
  B() : super(S(0)) {
    on<Fetch>((event, emit) {
      final loading = state.loading + 1;
      emit(S(state.data, loading));
      add(_RealFetch());
    });
    on<_RealFetch>((event, emit) {
      emit(S(state.data + 1, state.loading));
    });
  }
}

class B$ extends Bloc<E, S> {
  B$() : super(S(0)) {
    on<Fetch>((event, emit) {
      final loading = state.loading + 1;
      emit(S(state.data, loading));
      emit(S(state.data + 1, loading));
    });
  }
}
