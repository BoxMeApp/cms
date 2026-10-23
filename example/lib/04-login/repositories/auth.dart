import 'dart:async';

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const .new(seconds: 1));
    yield .unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const .new(milliseconds: 300),
      () => _controller.add(.authenticated),
    );
  }

  void logOut() {
    _controller.add(.unauthenticated);
  }

  void dispose() => _controller.close();
}
