// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$S {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is S);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'S()';
}


}

/// @nodoc
class $SCopyWith<$Res>  {
$SCopyWith(S _, $Res Function(S) __);
}



/// @nodoc


class Zero implements S {
  const Zero([final  List<Post> posts = const []]): _posts = posts;
  

 final  List<Post> _posts;
@JsonKey() List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZeroCopyWith<Zero> get copyWith => _$ZeroCopyWithImpl<Zero>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Zero&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'S.zero(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $ZeroCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $ZeroCopyWith(Zero value, $Res Function(Zero) _then) = _$ZeroCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$ZeroCopyWithImpl<$Res>
    implements $ZeroCopyWith<$Res> {
  _$ZeroCopyWithImpl(this._self, this._then);

  final Zero _self;
  final $Res Function(Zero) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(Zero(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class Loaded implements S {
  const Loaded(final  List<Post> posts): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'S.loaded(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(Loaded(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class Done implements S {
  const Done(final  List<Post> posts): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoneCopyWith<Done> get copyWith => _$DoneCopyWithImpl<Done>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Done&&const DeepCollectionEquality().equals(other._posts, _posts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'S.done(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $DoneCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) _then) = _$DoneCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$DoneCopyWithImpl<$Res>
    implements $DoneCopyWith<$Res> {
  _$DoneCopyWithImpl(this._self, this._then);

  final Done _self;
  final $Res Function(Done) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(Done(
null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class Failed implements S {
  const Failed(this.message);
  

 final  String message;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<Failed> get copyWith => _$FailedCopyWithImpl<Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'S.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailedCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed _self;
  final $Res Function(Failed) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$A {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is A);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A()';
}


}

/// @nodoc
class $ACopyWith<$Res>  {
$ACopyWith(A _, $Res Function(A) __);
}



/// @nodoc


class Fetch implements A {
  const Fetch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.fetch()';
}


}




// dart format on
