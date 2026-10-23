import 'dart:async';
import 'dart:math';

import 'package:cms/cms.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

class Memory {
  final Map<Type, Map<int, Object>> _store = {};

  Future<T?> find<T>(int id) async {
    final map = _store[T];
    if (map == null) return null;
    return map[id] as T?;
  }

  Future<void> put<T>(T object, int id) async {
    final map = _store.putIfAbsent(T, () => {});
    map[id] = object!;
  }
}

StickyNote get _defaultNote => StickyNote(
  id: Random().nextInt(1000000),
  content: "",
  createdAt: DateTime.now(),
);

class M(final Memory _memory) extends Cms<S, A> {
  this : super(const .zero());

  // dart format off
  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Zero    _, _FetchNote  a) => () async {
                                    final id = a.id;
                                    final note = id != null
                                      ? await _memory.find<StickyNote>(id) 
                                      : _defaultNote;
                                    if (note == null) {
                                      return Failure('Note not found');
                                    }
                                    return Editing(note);
                                  }(),
    (Editing s, _NewContent a) => Editing(s.note.copyWith(content: a.content)),
    (Editing s, _Pop        _) => Done(s.note),
    _                          => undefined(s, a),
  };                     
  // dart format on
}

@freezed
abstract class StickyNote with _$StickyNote {
  const factory({
    required int id,
    required String content,
    required DateTime createdAt,
  }) = _StickyNote;
}

@freezed
sealed class S with _$S {
  const factory zero() = Zero;
  const factory editing(StickyNote note) = Editing;
  const factory done(StickyNote note) = Done;
  const factory failure(String message) = Failure;
}

@freezed
sealed class A with _$A {
  const factory pop() = _Pop;
  const factory fetchNote([int? id]) = _FetchNote;
  const factory newContent(String content) = _NewContent;
}
