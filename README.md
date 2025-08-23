# cms — Controlled Markov Stream

A tiny layer on top of `bloc` that models your app as **States** `S`, **Actions** `A`, and a **deterministic Markov kernel**. It gives you a single place to decide `S × A → S`, while still letting you (1) dispatch follow-up actions and (2) relay external streams into actions.

## Math (deterministic kernel)

* Kernel: $k: S \times A \to S$
* Update: $S_{t+1} = k(S_t, A_t)$

In code, you implement:

```dart
FutureOr<S?> kernel(
  S state,
  A action,
  void Function(A) dispatch, // recursive dispatch
  Relay<A> relay,            // external stream -> action
);
```

Where:

```dart
typedef Relay<A> = Future<void> Function<T>(
  Stream<T> stream,
  A? Function(T value) toAction,
);
```

* **dispatch(A)**: convenient way to keep advancing logic via actions (recursive/stepwise processing).
* **relay(stream, toAction)**: turn any `Stream<T>` into actions `A` and dispatch them.

## Quick example

```dart
@freezed
sealed class A with _$A {
  const factory A.pop() = Pop;
  const factory A.fetchNote([int? id]) = FetchNote;
  const factory A.newContent(String content) = NewContent;
}

@freezed
sealed class S with _$S {
  const factory S.zero() = Zero;
  const factory S.editing(StickyNote note) = Editing;
  const factory S.done(StickyNote note) = Done;
  const factory S.failure(String message) = Failure;
}


class NoteEditCms extends Cms<S, A> {
  final Memory _memory;

  NoteEditCms(this._memory) : super(const Zero());

  @override
  Future<S?> kernel(
    S s,
    A a,
    void Function(A) dispatch,
    Relay<A> relay,
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
        _ => Failure('algebraic error: $s -- $a -->'),
      };
}
```

## When to use `pace<E>(...)`

Attach concurrency/flow control per action type:

* `restartable()` — keep only the newest (great for searches/long streams).
* `droppable()` — drop new ones while busy (great for buttons/Start).
* `concurrent()` — allow parallel handling.
* `sequential()` — queue and handle one by one.

Example:

```dart
pace<SearchChanged>(restartable()); // new search cancels the old one
pace<Submit>(droppable());          // ignore double taps while submitting
```

## Why CMS?

* **Single place to reason about behavior**: a deterministic kernel `S × A → S`.
* **Explicit side-effects**: external inputs enter through `relay`; follow-ups are explicit `dispatch`ed actions.
* **Per-action flow control**: `pace<E>` composes naturally with `bloc_concurrency`.

