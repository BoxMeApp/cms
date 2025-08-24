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
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(Resume value)? resume,
    TResult Function(Reset value)? reset,
    TResult Function(Tick value)? tick,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Start() when start != null:
        return start(_that);
      case Pause() when pause != null:
        return pause(_that);
      case Resume() when resume != null:
        return resume(_that);
      case Reset() when reset != null:
        return reset(_that);
      case Tick() when tick != null:
        return tick(_that);
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
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(Resume value) resume,
    required TResult Function(Reset value) reset,
    required TResult Function(Tick value) tick,
  }) {
    final _that = this;
    switch (_that) {
      case Start():
        return start(_that);
      case Pause():
        return pause(_that);
      case Resume():
        return resume(_that);
      case Reset():
        return reset(_that);
      case Tick():
        return tick(_that);
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
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(Resume value)? resume,
    TResult? Function(Reset value)? reset,
    TResult? Function(Tick value)? tick,
  }) {
    final _that = this;
    switch (_that) {
      case Start() when start != null:
        return start(_that);
      case Pause() when pause != null:
        return pause(_that);
      case Resume() when resume != null:
        return resume(_that);
      case Reset() when reset != null:
        return reset(_that);
      case Tick() when tick != null:
        return tick(_that);
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
    TResult Function()? start,
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? reset,
    TResult Function(int duration)? tick,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Start() when start != null:
        return start();
      case Pause() when pause != null:
        return pause();
      case Resume() when resume != null:
        return resume();
      case Reset() when reset != null:
        return reset();
      case Tick() when tick != null:
        return tick(_that.duration);
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
    required TResult Function() start,
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() reset,
    required TResult Function(int duration) tick,
  }) {
    final _that = this;
    switch (_that) {
      case Start():
        return start();
      case Pause():
        return pause();
      case Resume():
        return resume();
      case Reset():
        return reset();
      case Tick():
        return tick(_that.duration);
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
    TResult? Function()? start,
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? reset,
    TResult? Function(int duration)? tick,
  }) {
    final _that = this;
    switch (_that) {
      case Start() when start != null:
        return start();
      case Pause() when pause != null:
        return pause();
      case Resume() when resume != null:
        return resume();
      case Reset() when reset != null:
        return reset();
      case Tick() when tick != null:
        return tick(_that.duration);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Start implements A {
  const Start();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.start()';
  }
}

/// @nodoc

class Pause implements A {
  const Pause();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Pause);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.pause()';
  }
}

/// @nodoc

class Resume implements A {
  const Resume();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Resume);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.resume()';
  }
}

/// @nodoc

class Reset implements A {
  const Reset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.reset()';
  }
}

/// @nodoc

class Tick implements A {
  const Tick(this.duration);

  final int duration;

  /// Create a copy of A
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TickCopyWith<Tick> get copyWith =>
      _$TickCopyWithImpl<Tick>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tick &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @override
  String toString() {
    return 'A.tick(duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $TickCopyWith<$Res> implements $ACopyWith<$Res> {
  factory $TickCopyWith(Tick value, $Res Function(Tick) _then) =
      _$TickCopyWithImpl;
  @useResult
  $Res call({int duration});
}

/// @nodoc
class _$TickCopyWithImpl<$Res> implements $TickCopyWith<$Res> {
  _$TickCopyWithImpl(this._self, this._then);

  final Tick _self;
  final $Res Function(Tick) _then;

  /// Create a copy of A
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? duration = null,
  }) {
    return _then(Tick(
      null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
