import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'models/post.dart';
import 'repositories/repository.dart';

part 'cms.freezed.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

@freezed
sealed class S with _$S {
  const factory zero() = Zero;
  const factory loaded(List<Post> posts) = Loaded;
  const factory done(List<Post> posts) = Done;
  const factory failed(String message) = Failed;
}

@freezed
sealed class A with _$A {
  const factory fetch() = _Fetch;
}

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>()(events.throttle(duration), mapper);
  };
}

class M(final Repository _repository) extends Cms<S, A> {
  this : super(const .zero()) {
    pace<_Fetch>(throttleDroppable(throttleDuration));
  }

  // dart format off
  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Zero   _, _Fetch a) => kernel(Loaded([]), a),
    (Loaded s, _Fetch _) => () async {
                              final posts = s.posts;
                              final newPosts = await _repository.fetch(
                                                posts.length, _postLimit);

                              if (newPosts.isEmpty) return Done(posts);

                              return Loaded([...posts, ...newPosts]);
                            }().catchError(
                              (_) => const Failed('Error fetching posts')),
    (Done   _, _Fetch _) => null,
    _                    => undefined(s, a),
  };
  // dart format on
}
