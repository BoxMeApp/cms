class CmsError<S, A> extends Error {
  final S s;
  final A a;

  CmsError(this.s, this.a);

  @override
  String toString() =>
      'cms error: ${s.runtimeType} -- ${a.runtimeType} --> ???';
}
