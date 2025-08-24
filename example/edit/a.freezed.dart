// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'a.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$A {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is A);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A()';
  }
}

/// @nodoc
class $ACopyWith<$Res> {
  $ACopyWith(A _, $Res Function(A) __);
}

/// Adds pattern-matching-related methods to [A].
extension APatterns on A {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pop value)? pop,
    TResult Function(FetchNote value)? fetchNote,
    TResult Function(NewContent value)? newContent,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Pop() when pop != null:
        return pop(_that);
      case FetchNote() when fetchNote != null:
        return fetchNote(_that);
      case NewContent() when newContent != null:
        return newContent(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pop value) pop,
    required TResult Function(FetchNote value) fetchNote,
    required TResult Function(NewContent value) newContent,
  }) {
    final _that = this;
    switch (_that) {
      case Pop():
        return pop(_that);
      case FetchNote():
        return fetchNote(_that);
      case NewContent():
        return newContent(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pop value)? pop,
    TResult? Function(FetchNote value)? fetchNote,
    TResult? Function(NewContent value)? newContent,
  }) {
    final _that = this;
    switch (_that) {
      case Pop() when pop != null:
        return pop(_that);
      case FetchNote() when fetchNote != null:
        return fetchNote(_that);
      case NewContent() when newContent != null:
        return newContent(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    TResult Function(int? id)? fetchNote,
    TResult Function(String content)? newContent,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Pop() when pop != null:
        return pop();
      case FetchNote() when fetchNote != null:
        return fetchNote(_that.id);
      case NewContent() when newContent != null:
        return newContent(_that.content);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
    required TResult Function(int? id) fetchNote,
    required TResult Function(String content) newContent,
  }) {
    final _that = this;
    switch (_that) {
      case Pop():
        return pop();
      case FetchNote():
        return fetchNote(_that.id);
      case NewContent():
        return newContent(_that.content);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pop,
    TResult? Function(int? id)? fetchNote,
    TResult? Function(String content)? newContent,
  }) {
    final _that = this;
    switch (_that) {
      case Pop() when pop != null:
        return pop();
      case FetchNote() when fetchNote != null:
        return fetchNote(_that.id);
      case NewContent() when newContent != null:
        return newContent(_that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Pop implements A {
  const Pop();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Pop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.pop()';
  }
}

/// @nodoc

class FetchNote implements A {
  const FetchNote([this.id]);

  final int? id;

  /// Create a copy of A
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchNoteCopyWith<FetchNote> get copyWith =>
      _$FetchNoteCopyWithImpl<FetchNote>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchNote &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'A.fetchNote(id: $id)';
  }
}

/// @nodoc
abstract mixin class $FetchNoteCopyWith<$Res> implements $ACopyWith<$Res> {
  factory $FetchNoteCopyWith(FetchNote value, $Res Function(FetchNote) _then) =
      _$FetchNoteCopyWithImpl;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class _$FetchNoteCopyWithImpl<$Res> implements $FetchNoteCopyWith<$Res> {
  _$FetchNoteCopyWithImpl(this._self, this._then);

  final FetchNote _self;
  final $Res Function(FetchNote) _then;

  /// Create a copy of A
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
  }) {
    return _then(FetchNote(
      freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class NewContent implements A {
  const NewContent(this.content);

  final String content;

  /// Create a copy of A
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewContentCopyWith<NewContent> get copyWith =>
      _$NewContentCopyWithImpl<NewContent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewContent &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @override
  String toString() {
    return 'A.newContent(content: $content)';
  }
}

/// @nodoc
abstract mixin class $NewContentCopyWith<$Res> implements $ACopyWith<$Res> {
  factory $NewContentCopyWith(
          NewContent value, $Res Function(NewContent) _then) =
      _$NewContentCopyWithImpl;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$NewContentCopyWithImpl<$Res> implements $NewContentCopyWith<$Res> {
  _$NewContentCopyWithImpl(this._self, this._then);

  final NewContent _self;
  final $Res Function(NewContent) _then;

  /// Create a copy of A
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = null,
  }) {
    return _then(NewContent(
      null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
