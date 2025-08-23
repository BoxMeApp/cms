import 'cms.dart';

void main() async {
  final memory = Memory();
  final cms = NoteEditCms(memory);

  print(cms.state);

  cms.add(FetchNote());

  await Future.delayed(Duration.zero);

  print(cms.state);

  /// Close the `cms` when it is no longer needed.
  await cms.close();
}
