import 'dart:async';
import 'dart:math';

import 'package:cms/cms.dart';

import 's.dart';
import 'a.dart';

export 'a.dart';
export 's.dart';

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

class NoteEditCms extends Cms<S, A> {
  final Memory _memory;

  NoteEditCms(this._memory) : super(const Zero());

  @override
  Future<S?> kernel(
    S s,
    A a,
  ) async =>
      switch ((s, a)) {
        (Zero(), FetchNote(:final id)) => () async {
            final note = id != null
                ? await _memory.find<StickyNote>(id)
                : StickyNote(
                    id: Random().nextInt(1000000),
                    content: "",
                    createdAt: DateTime.now(),
                  );
            if (note == null) return Failure('Note not found');
            return Editing(note);
          }(),
        (Editing(:final note), NewContent(:final content)) => Editing(
            note.copyWith(content: content),
          ),
        (Editing(:final note), Pop()) => Done(note),
        _ => throw CmsError(s, a),
      };
}
