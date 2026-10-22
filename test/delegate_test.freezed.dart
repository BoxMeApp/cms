// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delegate_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$E {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is E);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'E()';
}


}

/// @nodoc
class $ECopyWith<$Res>  {
$ECopyWith(E _, $Res Function(E) __);
}



/// @nodoc


class _Fetch implements E {
  const _Fetch();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'E.fetch()';
}


}




/// @nodoc


class _RealFetch implements E {
  const _RealFetch();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealFetch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'E._realFetch()';
}


}




/// @nodoc
mixin _$S {

 int get data; int get loading;
/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SCopyWith<S> get copyWith => _$SCopyWithImpl<S>(this as S, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as S;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is S&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.loading, _this.loading) || other.loading == _this.loading));
}


@override
int get hashCode {
  final _this = this as S;
  return Object.hash(runtimeType,_this.data,_this.loading);
}

@override
String toString() {
  final _this = this as S;
  return 'S(data: ${_this.data}, loading: ${_this.loading})';
}


}

/// @nodoc
abstract mixin class $SCopyWith<$Res>  {
  factory $SCopyWith(S value, $Res Function(S) _then) = _$SCopyWithImpl;
@useResult
$Res call({
 int data, int loading
});




}
/// @nodoc
class _$SCopyWithImpl<$Res>
    implements $SCopyWith<$Res> {
  _$SCopyWithImpl(this._self, this._then);

  final S _self;
  final $Res Function(S) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? loading = null,}) {
  return _then(S(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as int,null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



/// @nodoc


class _S implements S {
  const _S(this.data, [this.loading = 0]);
  

@override final  int data;
@override@JsonKey() final  int loading;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SCopyWith<_S> get copyWith => __$SCopyWithImpl<_S>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _S&&(identical(other.data, data) || other.data == data)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode {
    return Object.hash(runtimeType,data,loading);
}

@override
String toString() {
    return 'S(data: $data, loading: $loading)';
}


}

/// @nodoc
abstract mixin class _$SCopyWith<$Res> implements $SCopyWith<$Res> {
  factory _$SCopyWith(_S value, $Res Function(_S) _then) = __$SCopyWithImpl;
@override @useResult
$Res call({
 int data, int loading
});




}
/// @nodoc
class __$SCopyWithImpl<$Res>
    implements _$SCopyWith<$Res> {
  __$SCopyWithImpl(this._self, this._then);

  final _S _self;
  final $Res Function(_S) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? loading = null,}) {
  return _then(_S(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as int,null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
