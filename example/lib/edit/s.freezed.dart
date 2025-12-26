// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 's.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StickyNote&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,content,createdAt);

@override
String toString() {
  return 'StickyNote(id: $id, content: $content, createdAt: $createdAt)';
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
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StickyNote].
extension StickyNotePatterns on StickyNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StickyNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StickyNote() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StickyNote value)  $default,){
final _that = this;
switch (_that) {
case _StickyNote():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StickyNote value)?  $default,){
final _that = this;
switch (_that) {
case _StickyNote() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String content,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StickyNote() when $default != null:
return $default(_that.id,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String content,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StickyNote():
return $default(_that.id,_that.content,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String content,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StickyNote() when $default != null:
return $default(_that.id,_that.content,_that.createdAt);case _:
  return null;

}
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
int get hashCode => Object.hash(runtimeType,id,content,createdAt);

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


/// Adds pattern-matching-related methods to [S].
extension SPatterns on S {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Zero value)?  zero,TResult Function( Editing value)?  editing,TResult Function( Done value)?  done,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Zero() when zero != null:
return zero(_that);case Editing() when editing != null:
return editing(_that);case Done() when done != null:
return done(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Zero value)  zero,required TResult Function( Editing value)  editing,required TResult Function( Done value)  done,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case Zero():
return zero(_that);case Editing():
return editing(_that);case Done():
return done(_that);case Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Zero value)?  zero,TResult? Function( Editing value)?  editing,TResult? Function( Done value)?  done,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case Zero() when zero != null:
return zero(_that);case Editing() when editing != null:
return editing(_that);case Done() when done != null:
return done(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  zero,TResult Function( StickyNote note)?  editing,TResult Function( StickyNote note)?  done,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Zero() when zero != null:
return zero();case Editing() when editing != null:
return editing(_that.note);case Done() when done != null:
return done(_that.note);case Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  zero,required TResult Function( StickyNote note)  editing,required TResult Function( StickyNote note)  done,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case Zero():
return zero();case Editing():
return editing(_that.note);case Done():
return done(_that.note);case Failure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  zero,TResult? Function( StickyNote note)?  editing,TResult? Function( StickyNote note)?  done,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case Zero() when zero != null:
return zero();case Editing() when editing != null:
return editing(_that.note);case Done() when done != null:
return done(_that.note);case Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

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
int get hashCode => Object.hash(runtimeType,note);

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
int get hashCode => Object.hash(runtimeType,note);

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
int get hashCode => Object.hash(runtimeType,message);

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

// dart format on
