import 'package:cms/cms.dart';

import 's.dart';
import 'a.dart';

export 'a.dart';
export 's.dart';

class M extends Cms<S, A> {
  M() : super(const Zero());

  @override
  S kernel(S s, A a) => switch ((s, a)) {
    _ => undefined(s, a),
  };

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is CmsError) {
      print(error);
      print(stackTrace);
    }
    super.onError(error, stackTrace);
  }
}
