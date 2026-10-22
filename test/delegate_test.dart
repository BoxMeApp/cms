import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cms/cms.dart';
import 'package:test/test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delegate_test.freezed.dart';

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
      act: (cms) => cms.add(const .fetch()),
      expect: () => [S(0, 1), S(1, 1)],
    );

    blocTest(
      "case 2",
      build: () => M(),
      act: (cms) => cms
        ..add(const .fetch())
        ..add(const .fetch()),
      expect: () => [S(0, 1), S(0, 2), S(1, 2), S(2, 2)],
    );
  });

  group('bloc delegate', () {
    blocTest(
      'case 1',
      build: () => B(),
      act: (bloc) => bloc.add(const .fetch()),
      expect: () => [S(0, 1), S(1, 1)],
    );

    blocTest(
      "case 2",
      build: () => B$(),
      act: (bloc) => bloc
        ..add(const .fetch())
        ..add(const .fetch()),
      expect: () => [S(0, 1), S(1, 1), S(1, 2), S(2, 2)],
    );

    blocTest(
      "case 2'",
      build: () => B(),
      act: (bloc) => bloc
        ..add(const .fetch())
        ..add(const .fetch()),
      expect: () => [S(0, 1), S(0, 2), S(1, 2), S(2, 2)],
    );
  });
}

@freezed
sealed class E with _$E {
  const factory fetch() = _Fetch;
  const factory _realFetch() = _RealFetch;
}

@freezed
abstract class S with _$S {
  const factory(int data, [@Default(0) int loading]) = _S;
}

class M extends Cms<S, E> {
  M() : super(S(0));

  // dart format off
  @override
  FutureOr<S?> kernel(S s, E a) => switch ((s, a)) {
    (S s, _Fetch     a) => () {
                            add(const ._realFetch());
                            return S(s.data, s.loading + 1);
                          }(),
    (S s, _RealFetch a) => S(s.data + 1, s.loading),
  };
  // dart format on
}

class B extends Bloc<E, S> {
  B() : super(S(0)) {
    on<_Fetch>((event, emit) {
      final loading = state.loading + 1;
      emit(S(state.data, loading));
      add(const ._realFetch());
    });
    on<_RealFetch>((event, emit) {
      emit(S(state.data + 1, state.loading));
    });
  }
}

class B$ extends Bloc<E, S> {
  B$() : super(S(0)) {
    on<_Fetch>((event, emit) {
      final loading = state.loading + 1;
      emit(S(state.data, loading));
      emit(S(state.data + 1, loading));
    });
  }
}
