// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Action {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Action);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Action()';
}


}

/// @nodoc
class $ActionCopyWith<$Res>  {
$ActionCopyWith(Action _, $Res Function(Action) __);
}



/// @nodoc


class _Slow implements Action {
  const _Slow(this.id);
  

 final  int id;

/// Create a copy of Action
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlowCopyWith<_Slow> get copyWith => __$SlowCopyWithImpl<_Slow>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Slow&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'Action.slow(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SlowCopyWith<$Res> implements $ActionCopyWith<$Res> {
  factory _$SlowCopyWith(_Slow value, $Res Function(_Slow) _then) = __$SlowCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$SlowCopyWithImpl<$Res>
    implements _$SlowCopyWith<$Res> {
  __$SlowCopyWithImpl(this._self, this._then);

  final _Slow _self;
  final $Res Function(_Slow) _then;

/// Create a copy of Action
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Slow(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Quick implements Action {
  const _Quick();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'Action.quick()';
}


}




// dart format on
