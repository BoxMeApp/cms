# CMS examples

Requires Dart 3.13 or later. Each `cms.dart` keeps state `S`, private action variants `A`, and model `M` together. Models use primary constructors and receive repositories through constructor injection. Dispatch actions with dot shorthand, for example `model.add(const .increment())`.

Freezed factories use abbreviated constructors. Transition tables stay in `kernel`; `dart format off/on` preserves their alignment.

```sh
dart run build_runner build
flutter analyze
flutter test
```

`lib/edit/main.dart` demonstrates editing a note; `lib/error/main.dart` demonstrates undefined transitions and error observation. The login example is a scaffold.
