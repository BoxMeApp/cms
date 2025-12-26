import 'package:cms/cms.dart';

import 'cms.dart';

void main() async {
  Bloc.observer = Observer();

  final m = M();

  print(m.state);

  m.add(Trigger());

  await Future.delayed(Duration.zero);

  print(m.state);

  /// Close the `cms` when it is no longer needed.
  await m.close();
}

class Observer extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (error is CmsError) {
      print(error);
      print(stackTrace);
    }
    super.onError(bloc, error, stackTrace);
  }
}
