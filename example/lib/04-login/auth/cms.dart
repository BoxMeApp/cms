import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repositories/user.dart';
import '../repositories/auth.dart';

part 'cms.freezed.dart';

@freezed
sealed class S with _$S {
  const factory S.unknown() = Unknown;
  const factory S.unauthenticated() = Unauthenticated;
  const factory S.authenticated(User user) = Authenticated;
}

@freezed
sealed class A with _$A {
  const factory A.watch() = _Watch;
  const factory A.logout() = _Logout;
  const factory A._$1() = _Auth;
  const factory A._$2() = _Unauth;
}

class M extends Cms<S, A> {
  final AuthenticationRepository _authRepo;
  final UserRepository _userRepo;
  M(this._authRepo, this._userRepo) : super(const Unknown());
  // dart format off
  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Unknown         s, _Watch  a) => kernel(const Unauthenticated(), a),
    (Unauthenticated s, _Watch  a) => forward(
                                        _authRepo.status,
                                        (status) => switch (status) {
                                          .unauthenticated => const _Unauth(),
                                          .authenticated => const _Auth(),
                                        },
                                      ).then((_) => null),
    (Authenticated   s, _Logout a) => () {
                                        _authRepo.logOut();
                                        return null;
                                      }(),
    (Unknown         s, _Auth   a) => kernel(const Unauthenticated(), a),
    (Unauthenticated s, _Auth   a) => () async {
                                        final user = await _userRepo.getUser();
                                        if (user == null) {
                                          return const Unauthenticated();
                                        }
                                        return Authenticated(user);
                                      }().catchError((_) => const Unauthenticated()),
    (                _, _Unauth a) => const Unauthenticated(),
    _                              => undefined(s, a),
  };
  // dart format on
}
