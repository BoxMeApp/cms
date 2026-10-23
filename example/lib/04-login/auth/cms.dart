import 'package:cms/cms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repositories/user.dart';
import '../repositories/auth.dart';

part 'cms.freezed.dart';

@freezed
sealed class S with _$S {
  const factory unknown() = Unknown;
  const factory unauthenticated() = Unauthenticated;
  const factory authenticated(User user) = Authenticated;
}

@freezed
sealed class A with _$A {
  const factory watch() = _Watch;
  const factory logout() = _Logout;
  const factory _authenticated() = _Auth;
  const factory _unauthenticated() = _Unauth;
}

class M(
  final AuthenticationRepository _authRepo,
  final UserRepository _userRepo,
) extends Cms<S, A> {
  this : super(const .unknown());
  // dart format off
  @override
  Future<S?> kernel(S s, A a) async => switch ((s, a)) {
    (Unknown         _, _Watch  a) => kernel(const Unauthenticated(), a),
    (Unauthenticated _, _Watch  _) => forward(
                                        _authRepo.status,
                                        (status) => switch (status) {
                                          .unauthenticated => const ._unauthenticated(),
                                          .authenticated => const ._authenticated(),
                                        },
                                      ).then((_) => null),
    (Authenticated   _, _Logout _) => () {
                                        _authRepo.logOut();
                                        return null;
                                      }(),
    (Unknown         _, _Auth   a) => kernel(const Unauthenticated(), a),
    (Unauthenticated _, _Auth   _) => () async {
                                        final user = await _userRepo.getUser();
                                        if (user == null) {
                                          return const Unauthenticated();
                                        }
                                        return Authenticated(user);
                                      }().catchError((_) => const Unauthenticated()),
    (                _, _Unauth _) => const Unauthenticated(),
    _                              => undefined(s, a),
  };
  // dart format on
}
