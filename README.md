# cms

[English](README.md) | [中文](README_zh.md)

While learning `bloc`, I found it remarkably similar to control equations, which taught me to think mathematically. I further encapsulated it to make it closer to mathematical form.

From a dynamical systems perspective, viewing an object (such as an app or menu) looks like:

```math
\begin{cases}
\dot s = f(s) \\
y = A \cdot s
\end{cases}
```

`bloc` represents f, and $`y = A \cdot s`$ is the observation equation, typically the UI, corresponding to `BlocBuilder` etc. However, here we focus more on the state equation.

Further examining the state equation, transforming it into discrete form:

```math
\begin{aligned}
&            & \dot s       &= f(s) \\
&\Rightarrow & \Delta s     &= s' - s \\
&\Rightarrow & s + \Delta s &= s' 
\end{aligned}
```

Where s is the current state, $`\Delta s`$ is the state change, often observed by people and called an action or event. s' is the next state. Therefore, we maintain this form when writing code:

```math
(s, a) \to s'
```

Viewing the code from a distance, it satisfies this form:

![](image/collapse.png)

If you need to examine the internal details carefully, you can expand it:

![](image/expand.png)

Why not define a function instead of using anonymous functions? Because S + A serves as the annotation, and coming up with another name is quite laborious.

## example

Using the [flutter-timer](https://bloclibrary.dev/tutorials/flutter-timer/) from bloc as an example:

Thinking with mathematical modeling, first we have the state:

```haskell
data S = Zero Int
       | Paused Int
       | Running Int
       | Completed Int
```

Then the actions that users can trigger:

```haskell
data A = Start
       | Pause
       | Resume
       | Reset
```

> Tick is an internal event discovered through further consideration. The model doesn't need to be complete at once; it can be iterative.

Translating into Dart code:

```dart

@freezed
sealed class S with _$S {
  const factory S.zero(int duration) = Zero;
  const factory S.paused(int duration, StreamSubscription<int> subscription) =
      Paused;
  const factory S.running(int duration, StreamSubscription<int> subscription) =
      Running;
  const factory S.completed(int duration) = Completed;
}

@freezed
sealed class A with _$A {
  const factory A.start() = Start;
  const factory A.pause() = Pause;
  const factory A.resume() = Resume;
  const factory A.reset() = Reset;
  const factory A.tick(int duration) = Tick;
}


class M extends Cms<S, A> {
  final Ticker _ticker;
  M(this._ticker) : super(const Zero(_duration));

  // dart format off
  @override
  S? kernel(S s, A a) => switch ((s, a)) {
    (Zero(:final duration)                        , Start())               => () {
                                                                                final subscription = _ticker
                                                                                    .tick(ticks: _duration)
                                                                                    .listen((duration) => add(Tick(duration)));
                                                                                return Running(duration, subscription);
                                                                              }(),
    (Running(:final duration, :final subscription), Pause())               => () {
                                                                                subscription.pause();
                                                                                return Paused(duration, subscription);
                                                                              }(),
    (Paused(:final duration, :final subscription) , Resume())              => () {
                                                                                subscription.resume();
                                                                                return Running(duration, subscription);
                                                                              }(),
    (Paused(:final subscription) 
    || Running(:final subscription)               , Reset())               => () {
                                                                              subscription.cancel();
                                                                                return const Zero(_duration);
                                                                              }(),
    (Completed()                                  , Reset())               => const Zero(_duration),
    (Running(:final subscription)                 , Tick(:final duration)) => () {
                                                                                if (duration > 0) {
                                                                                  return Running(duration, subscription);
                                                                                } else {
                                                                                  subscription.cancel();
                                                                                  return const Completed(0);
                                                                                }
                                                                              }(),
    _                                                                      => throw StateError('algebric error: $s -- $a -->'),
  };
  // dart format on
}
```

## Forwarding

In some scenarios, you need to monitor an event stream from an external object, completely dependent on the outside. In this case, you can use forwarding to forward this external event as an internal event for processing.

```dart
class M extends Cms<S, A> {
  final ObjectBoxMemory _boxMemory;

  M(this._boxMemory) : super(const Zero());

  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Zero(:final notes) || Loaded(:final notes), WatchChanges()) => forward(
                                                                    _boxMemory
                                                                        .whereType<StickyNote>()
                                                                        .order(ObxStickyNote_.createdAt, OrderFlag.descending)
                                                                        .take(notes.length)
                                                                        .watch(),
                                                                    (notes) => UpdateNotes(notes),
                                                                    ).then((_) => null),
    _                                                            => undefined(s, a),
  };
}
```

## Response Rate Control

Actions or events are time-varying and need to be viewed from a temporal perspective, i.e., as a stream. In some scenarios, users may frequently trigger certain events, such as when scrolling to load more data, users might quickly swipe the list triggering multiple load events. To prevent this from causing application performance issues, you can use throttling to limit the event processing frequency.

```dart
class M extends Cms<S, A> {
  M() : super(const Zero()) {
    pace<Fetch>(throttleDroppable(const Duration(milliseconds: 500)));
  }
}
```

## Helper Tools

- vscode extension: [cms](https://marketplace.visualstudio.com/items?itemName=dzylikecode.cms-generator)
