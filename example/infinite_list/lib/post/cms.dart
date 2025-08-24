import 'package:cms/cms.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../repository/repository.dart';

import 's.dart';
import 'a.dart';

export 's.dart';
export 'a.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class M extends Cms<S, A> {
  final Repository _repository;

  M(this._repository) : super(const Zero()) {
    pace<Fetch>(throttleDroppable(throttleDuration));
  }

  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Zero(:final posts) || Loaded(:final posts), Fetch()) => () async {
      try {
        final newPosts = await _repository.fetch(posts.length, _postLimit);

        if (newPosts.isEmpty) return Done(posts);

        return Loaded([...posts, ...newPosts]);
      } catch (_) {
        return Failed('Error fetching posts');
      }
    }(),
    (Done(), Fetch()) => null,
    _ => undefined(s, a),
  };
}
