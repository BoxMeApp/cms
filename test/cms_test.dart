import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import '../example/edit/cms.dart';

void main() {
  blocTest(
    'emits [] when nothing is added',
    build: () => NoteEditCms(Memory()),
    expect: () => [],
  );

  test("initial state is Zero", () {
    final cms = NoteEditCms(Memory());
    expect(cms.state, Zero());
  });

  blocTest(
    'emits [Editing] when FetchNote is added',
    build: () => NoteEditCms(Memory()),
    act: (cms) => cms.add(FetchNote()),
    expect: () => [isA<Editing>()],
  );

  () {
    final note = StickyNote(id: 1, content: "hello", createdAt: DateTime.now());
    blocTest(
      'fetches existing note when FetchNote is added',
      build: () => NoteEditCms(Memory()..put(note, note.id)),
      act: (cms) => cms.add(FetchNote(note.id)),
      expect: () => [Editing(note)],
    );

    blocTest(
      'emits [Editing] when NewContent is added',
      build: () => NoteEditCms(Memory()..put(note, note.id)),
      act: (cms) => cms
        ..add(FetchNote(note.id))
        ..add(NewContent("world")),
      expect: () => [Editing(note), Editing(note.copyWith(content: "world"))],
    );
  }();
}
