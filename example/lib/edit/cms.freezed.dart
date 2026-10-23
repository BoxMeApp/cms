// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StickyNote {

 int get id; String get content; DateTime get createdAt;
/// Create a copy of StickyNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StickyNoteCopyWith<StickyNote> get copyWith => _$StickyNoteCopyWithImpl<StickyNote>(this as StickyNote, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StickyNote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StickyNote&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as StickyNote;
  return Object.hash(runtimeType,_this.id,_this.content,_this.createdAt);
}

@override
String toString() {
  final _this = this as StickyNote;
  return 'StickyNote(id: ${_this.id}, content: ${_this.content}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $StickyNoteCopyWith<$Res>  {
  factory $StickyNoteCopyWith(StickyNote value, $Res Function(StickyNote) _then) = _$StickyNoteCopyWithImpl;
@useResult
$Res call({
 int id, String content, DateTime createdAt
});




}
/// @nodoc
class _$StickyNoteCopyWithImpl<$Res>
    implements $StickyNoteCopyWith<$Res> {
  _$StickyNoteCopyWithImpl(this._self, this._then);

  final StickyNote _self;
  final $Res Function(StickyNote) _then;

/// Create a copy of StickyNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? createdAt = null,}) {
  return _then(StickyNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}



/// @nodoc


class _StickyNote implements StickyNote {
  const _StickyNote({required this.id, required this.content, required this.createdAt});
  

@override final  int id;
@override final  String content;
@override final  DateTime createdAt;

/// Create a copy of StickyNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StickyNoteCopyWith<_StickyNote> get copyWith => __$StickyNoteCopyWithImpl<_StickyNote>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StickyNote&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,content,createdAt);
}

@override
String toString() {
    return 'StickyNote(id: $id, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StickyNoteCopyWith<$Res> implements $StickyNoteCopyWith<$Res> {
  factory _$StickyNoteCopyWith(_StickyNote value, $Res Function(_StickyNote) _then) = __$StickyNoteCopyWithImpl;
@override @useResult
$Res call({
 int id, String content, DateTime createdAt
});




}
/// @nodoc
class __$StickyNoteCopyWithImpl<$Res>
    implements _$StickyNoteCopyWith<$Res> {
  __$StickyNoteCopyWithImpl(this._self, this._then);

  final _StickyNote _self;
  final $Res Function(_StickyNote) _then;

/// Create a copy of StickyNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_StickyNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

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
  const Zero();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Zero);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'S.zero()';
}


}




/// @nodoc


class Editing implements S {
  const Editing(this.note);
  

 final  StickyNote note;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditingCopyWith<Editing> get copyWith => _$EditingCopyWithImpl<Editing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Editing&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,note);
}

@override
String toString() {
    return 'S.editing(note: $note)';
}


}

/// @nodoc
abstract mixin class $EditingCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $EditingCopyWith(Editing value, $Res Function(Editing) _then) = _$EditingCopyWithImpl;
@useResult
$Res call({
 StickyNote note
});


$StickyNoteCopyWith<$Res> get note;

}
/// @nodoc
class _$EditingCopyWithImpl<$Res>
    implements $EditingCopyWith<$Res> {
  _$EditingCopyWithImpl(this._self, this._then);

  final Editing _self;
  final $Res Function(Editing) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(Editing(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as StickyNote,
  ));
}

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StickyNoteCopyWith<$Res> get note {
  
  return $StickyNoteCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc


class Done implements S {
  const Done(this.note);
  

 final  StickyNote note;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoneCopyWith<Done> get copyWith => _$DoneCopyWithImpl<Done>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Done&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,note);
}

@override
String toString() {
    return 'S.done(note: $note)';
}


}

/// @nodoc
abstract mixin class $DoneCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) _then) = _$DoneCopyWithImpl;
@useResult
$Res call({
 StickyNote note
});


$StickyNoteCopyWith<$Res> get note;

}
/// @nodoc
class _$DoneCopyWithImpl<$Res>
    implements $DoneCopyWith<$Res> {
  _$DoneCopyWithImpl(this._self, this._then);

  final Done _self;
  final $Res Function(Done) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(Done(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as StickyNote,
  ));
}

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StickyNoteCopyWith<$Res> get note {
  
  return $StickyNoteCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc


class Failure implements S {
  const Failure(this.message);
  

 final  String message;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'S.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $SCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of S
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure(
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


class _Pop implements A {
  const _Pop();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pop);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'A.pop()';
}


}




/// @nodoc


class _FetchNote implements A {
  const _FetchNote([this.id]);
  

 final  int? id;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchNoteCopyWith<_FetchNote> get copyWith => __$FetchNoteCopyWithImpl<_FetchNote>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNote&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'A.fetchNote(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchNoteCopyWith<$Res> implements $ACopyWith<$Res> {
  factory _$FetchNoteCopyWith(_FetchNote value, $Res Function(_FetchNote) _then) = __$FetchNoteCopyWithImpl;
@useResult
$Res call({
 int? id
});




}
/// @nodoc
class __$FetchNoteCopyWithImpl<$Res>
    implements _$FetchNoteCopyWith<$Res> {
  __$FetchNoteCopyWithImpl(this._self, this._then);

  final _FetchNote _self;
  final $Res Function(_FetchNote) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,}) {
  return _then(_FetchNote(
freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _NewContent implements A {
  const _NewContent(this.content);
  

 final  String content;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewContentCopyWith<_NewContent> get copyWith => __$NewContentCopyWithImpl<_NewContent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewContent&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode {
    return Object.hash(runtimeType,content);
}

@override
String toString() {
    return 'A.newContent(content: $content)';
}


}

/// @nodoc
abstract mixin class _$NewContentCopyWith<$Res> implements $ACopyWith<$Res> {
  factory _$NewContentCopyWith(_NewContent value, $Res Function(_NewContent) _then) = __$NewContentCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class __$NewContentCopyWithImpl<$Res>
    implements _$NewContentCopyWith<$Res> {
  __$NewContentCopyWithImpl(this._self, this._then);

  final _NewContent _self;
  final $Res Function(_NewContent) _then;

/// Create a copy of A
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_NewContent(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
