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
    TResult Function(Increment value)? increment,
    TResult Function(Decrement value)? decrement,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Increment() when increment != null:
        return increment(_that);
      case Decrement() when decrement != null:
        return decrement(_that);
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
    required TResult Function(Increment value) increment,
    required TResult Function(Decrement value) decrement,
  }) {
    final _that = this;
    switch (_that) {
      case Increment():
        return increment(_that);
      case Decrement():
        return decrement(_that);
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
    TResult? Function(Increment value)? increment,
    TResult? Function(Decrement value)? decrement,
  }) {
    final _that = this;
    switch (_that) {
      case Increment() when increment != null:
        return increment(_that);
      case Decrement() when decrement != null:
        return decrement(_that);
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
    TResult Function()? increment,
    TResult Function()? decrement,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Increment() when increment != null:
        return increment();
      case Decrement() when decrement != null:
        return decrement();
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
    required TResult Function() increment,
    required TResult Function() decrement,
  }) {
    final _that = this;
    switch (_that) {
      case Increment():
        return increment();
      case Decrement():
        return decrement();
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
    TResult? Function()? increment,
    TResult? Function()? decrement,
  }) {
    final _that = this;
    switch (_that) {
      case Increment() when increment != null:
        return increment();
      case Decrement() when decrement != null:
        return decrement();
      case _:
        return null;
    }
  }
}

/// @nodoc

class Increment implements A {
  const Increment();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Increment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.increment()';
  }
}

/// @nodoc

class Decrement implements A {
  const Decrement();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Decrement);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'A.decrement()';
  }
}

// dart format on
