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

 int get duration;
/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SCopyWith<S> get copyWith => _$SCopyWithImpl<S>(this as S, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is S&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'S(duration: $duration)';
}


}

/// @nodoc
abstract mixin class $SCopyWith<$Res>  {
  factory $SCopyWith(S value, $Res Function(S) _then) = _$SCopyWithImpl;
@useResult
$Res call({
 int duration
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
@pragma('vm:prefer-inline') @override $Res call({Object? duration = null,}) {
  return _then(_self.copyWith(
duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



/// @nodoc


class Zero implements S {
  const Zero(this.duration);
  

@override final  int duration;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZeroCopyWith<Zero> get copyWith => _$ZeroCopyWithImpl<Zero>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Zero&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'S.zero(duration: $duration)';
}


}

/// @nodoc
abstract mixin class $ZeroCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $ZeroCopyWith(Zero value, $Res Function(Zero) _then) = _$ZeroCopyWithImpl;
@override @useResult
$Res call({
 int duration
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
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(Zero(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Paused implements S {
  const Paused(this.duration, this.clock);
  

@override final  int duration;
 final  StreamSubscription<int> clock;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PausedCopyWith<Paused> get copyWith => _$PausedCopyWithImpl<Paused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paused&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.clock, clock) || other.clock == clock));
}


@override
int get hashCode => Object.hash(runtimeType,duration,clock);

@override
String toString() {
  return 'S.paused(duration: $duration, clock: $clock)';
}


}

/// @nodoc
abstract mixin class $PausedCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $PausedCopyWith(Paused value, $Res Function(Paused) _then) = _$PausedCopyWithImpl;
@override @useResult
$Res call({
 int duration, StreamSubscription<int> clock
});




}
/// @nodoc
class _$PausedCopyWithImpl<$Res>
    implements $PausedCopyWith<$Res> {
  _$PausedCopyWithImpl(this._self, this._then);

  final Paused _self;
  final $Res Function(Paused) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,Object? clock = null,}) {
  return _then(Paused(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,null == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as StreamSubscription<int>,
  ));
}


}

/// @nodoc


class Running implements S {
  const Running(this.duration, this.clock);
  

@override final  int duration;
 final  StreamSubscription<int> clock;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningCopyWith<Running> get copyWith => _$RunningCopyWithImpl<Running>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Running&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.clock, clock) || other.clock == clock));
}


@override
int get hashCode => Object.hash(runtimeType,duration,clock);

@override
String toString() {
  return 'S.running(duration: $duration, clock: $clock)';
}


}

/// @nodoc
abstract mixin class $RunningCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $RunningCopyWith(Running value, $Res Function(Running) _then) = _$RunningCopyWithImpl;
@override @useResult
$Res call({
 int duration, StreamSubscription<int> clock
});




}
/// @nodoc
class _$RunningCopyWithImpl<$Res>
    implements $RunningCopyWith<$Res> {
  _$RunningCopyWithImpl(this._self, this._then);

  final Running _self;
  final $Res Function(Running) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,Object? clock = null,}) {
  return _then(Running(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,null == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as StreamSubscription<int>,
  ));
}


}

/// @nodoc


class Completed implements S {
  const Completed(this.duration);
  

@override final  int duration;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletedCopyWith<Completed> get copyWith => _$CompletedCopyWithImpl<Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Completed&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'S.completed(duration: $duration)';
}


}

/// @nodoc
abstract mixin class $CompletedCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $CompletedCopyWith(Completed value, $Res Function(Completed) _then) = _$CompletedCopyWithImpl;
@override @useResult
$Res call({
 int duration
});




}
/// @nodoc
class _$CompletedCopyWithImpl<$Res>
    implements $CompletedCopyWith<$Res> {
  _$CompletedCopyWithImpl(this._self, this._then);

  final Completed _self;
  final $Res Function(Completed) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(Completed(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
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


class _Start implements A {
  const _Start();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Start);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.start()';
}


}




/// @nodoc


class _Pause implements A {
  const _Pause();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pause);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.pause()';
}


}




/// @nodoc


class _Resume implements A {
  const _Resume();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resume);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.resume()';
}


}




/// @nodoc


class _Reset implements A {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'A.reset()';
}


}




/// @nodoc


class _Tick implements A {
  const _Tick(this.duration);
  

 final  int duration;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TickCopyWith<_Tick> get copyWith => __$TickCopyWithImpl<_Tick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tick&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'A._tick(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$TickCopyWith<$Res> implements $ACopyWith<$Res> {
  factory _$TickCopyWith(_Tick value, $Res Function(_Tick) _then) = __$TickCopyWithImpl;
@useResult
$Res call({
 int duration
});




}
/// @nodoc
class __$TickCopyWithImpl<$Res>
    implements _$TickCopyWith<$Res> {
  __$TickCopyWithImpl(this._self, this._then);

  final _Tick _self;
  final $Res Function(_Tick) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_Tick(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
