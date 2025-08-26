import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'error.dart';

typedef _Forward<A> = Future<void> Function<T>(
    Stream<T> stream, A? Function(T) onData);

/// Controlled Markov Stream
abstract class Cms<S, A> extends Bloc<A, S> {
  Cms(super.s0, [EventTransformer<A>? transformer]) {
    on<A>(_defaultHandler, transformer: transformer);
  }

  /// markov kernel
  FutureOr<S?> kernel(S s, A a);

  late _Forward<A> _forward;
  @mustCallSuper
  Future<void> forward<T>(Stream<T> stream, A? Function(T) onData) =>
      _forward(stream, onData);

  Future<void> _handler(A event, Emitter<S> emit) async {
    _forward = <T>(stream, onData) => emit.onEach<T>(stream, onData: (data) {
          final a = onData(data);
          if (a != null) {
            add(a);
          }
        });
    final s = await kernel(
      state,
      event,
    );
    if (s != null) {
      emit(s);
    }
  }

  Future<void> _defaultHandler(A event, Emitter<S> emit) async {
    if (_paceGuards.any((t) => t(event))) {
      return;
    }
    return _handler(event, emit);
  }

  final List<bool Function(A)> _paceGuards = [];

  @mustCallSuper
  void pace<E extends A>(EventTransformer<E> transformer) {
    _paceGuards.add((event) => event is E);

    on<E>(_handler, transformer: transformer);
  }

  @mustCallSuper
  S undefined(S s, A a) {
    addError(CmsError(s, a));
    return s;
  }

  S? id<T>(T t) => t is S ? t : null;
}
