import 'cms.dart';

void main() async {
  final memory = Memory();
  final cms = M(memory);

  print(cms.state);

  cms.add(const .fetchNote());

  await Future.delayed(.zero);

  print(cms.state);

  /// Close the `cms` when it is no longer needed.
  await cms.close();
}
