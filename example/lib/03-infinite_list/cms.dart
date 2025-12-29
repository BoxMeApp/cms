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
  const factory S.zero([@Default([]) List<Post> posts]) = Zero;
  const factory S.loaded(List<Post> posts) = Loaded;
  const factory S.done(List<Post> posts) = Done;
  const factory S.failed(String message) = Failed;
}

@freezed
sealed class A with _$A {
  const factory A.fetch() = _Fetch;
}

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>()(events.throttle(duration), mapper);
  };
}

class M extends Cms<S, A> {
  final Repository _repository;

  M(this._repository) : super(const Zero()) {
    pace<_Fetch>(throttleDroppable(throttleDuration));
  }

  // dart format off
  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Zero(:final posts) 
    || Loaded(:final posts), _Fetch()) => () async {
                                            final newPosts = await _repository
                                              .fetch(posts.length, _postLimit);

                                            if (newPosts.isEmpty) return Done(posts);

                                            return Loaded([...posts, ...newPosts]);
                                          }().catchError(
                                            (_) => const Failed('Error fetching posts')
                                          ),
    (Done()                , _Fetch()) =>  null,
    _                                  =>  undefined(s, a),
  };
  // dart format on
}
