// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$T>()';
}


}

/// @nodoc
class $ResultCopyWith<T,$Res>  {
$ResultCopyWith(Result<T> _, $Res Function(Result<T>) __);
}


/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns<T> on Result<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SuccessResult<T> value)?  success,TResult Function( FailureResult<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SuccessResult() when success != null:
return success(_that);case FailureResult() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SuccessResult<T> value)  success,required TResult Function( FailureResult<T> value)  failure,}){
final _that = this;
switch (_that) {
case SuccessResult():
return success(_that);case FailureResult():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SuccessResult<T> value)?  success,TResult? Function( FailureResult<T> value)?  failure,}){
final _that = this;
switch (_that) {
case SuccessResult() when success != null:
return success(_that);case FailureResult() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T value)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SuccessResult() when success != null:
return success(_that.value);case FailureResult() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T value)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SuccessResult():
return success(_that.value);case FailureResult():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T value)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SuccessResult() when success != null:
return success(_that.value);case FailureResult() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SuccessResult<T> extends Result<T> {
  const SuccessResult(this.value): super._();
  

 final  T value;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessResultCopyWith<T, SuccessResult<T>> get copyWith => _$SuccessResultCopyWithImpl<T, SuccessResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessResult<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Result<$T>.success(value: $value)';
}


}

/// @nodoc
abstract mixin class $SuccessResultCopyWith<T,$Res> implements $ResultCopyWith<T, $Res> {
  factory $SuccessResultCopyWith(SuccessResult<T> value, $Res Function(SuccessResult<T>) _then) = _$SuccessResultCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$SuccessResultCopyWithImpl<T,$Res>
    implements $SuccessResultCopyWith<T, $Res> {
  _$SuccessResultCopyWithImpl(this._self, this._then);

  final SuccessResult<T> _self;
  final $Res Function(SuccessResult<T>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(SuccessResult<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureResultCopyWith<T, FailureResult<T>> get copyWith => _$FailureResultCopyWithImpl<T, FailureResult<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureResult<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'Result<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FailureResultCopyWith<T,$Res> implements $ResultCopyWith<T, $Res> {
  factory $FailureResultCopyWith(FailureResult<T> value, $Res Function(FailureResult<T>) _then) = _$FailureResultCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$FailureResultCopyWithImpl<T,$Res>
    implements $FailureResultCopyWith<T, $Res> {
  _$FailureResultCopyWithImpl(this._self, this._then);

  final FailureResult<T> _self;
  final $Res Function(FailureResult<T>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(FailureResult<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
