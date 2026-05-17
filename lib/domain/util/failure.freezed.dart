// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
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

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CancelException value)?  cancelException,TResult Function( ConnectionTimeoutException value)?  connectionTimeoutException,TResult Function( ReceiveTimeoutException value)?  receiveTimeoutException,TResult Function( SendTimeoutException value)?  sendTimeoutException,TResult Function( SocketException value)?  socketException,TResult Function( UnrecognizedException value)?  unrecognizedException,TResult Function( TokenEpiredException value)?  tokenExpiredException,TResult Function( ServerException value)?  serverException,TResult Function( FormatException value)?  formatException,TResult Function( SerializationException value)?  serializationException,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CancelException() when cancelException != null:
return cancelException(_that);case ConnectionTimeoutException() when connectionTimeoutException != null:
return connectionTimeoutException(_that);case ReceiveTimeoutException() when receiveTimeoutException != null:
return receiveTimeoutException(_that);case SendTimeoutException() when sendTimeoutException != null:
return sendTimeoutException(_that);case SocketException() when socketException != null:
return socketException(_that);case UnrecognizedException() when unrecognizedException != null:
return unrecognizedException(_that);case TokenEpiredException() when tokenExpiredException != null:
return tokenExpiredException(_that);case ServerException() when serverException != null:
return serverException(_that);case FormatException() when formatException != null:
return formatException(_that);case SerializationException() when serializationException != null:
return serializationException(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CancelException value)  cancelException,required TResult Function( ConnectionTimeoutException value)  connectionTimeoutException,required TResult Function( ReceiveTimeoutException value)  receiveTimeoutException,required TResult Function( SendTimeoutException value)  sendTimeoutException,required TResult Function( SocketException value)  socketException,required TResult Function( UnrecognizedException value)  unrecognizedException,required TResult Function( TokenEpiredException value)  tokenExpiredException,required TResult Function( ServerException value)  serverException,required TResult Function( FormatException value)  formatException,required TResult Function( SerializationException value)  serializationException,}){
final _that = this;
switch (_that) {
case CancelException():
return cancelException(_that);case ConnectionTimeoutException():
return connectionTimeoutException(_that);case ReceiveTimeoutException():
return receiveTimeoutException(_that);case SendTimeoutException():
return sendTimeoutException(_that);case SocketException():
return socketException(_that);case UnrecognizedException():
return unrecognizedException(_that);case TokenEpiredException():
return tokenExpiredException(_that);case ServerException():
return serverException(_that);case FormatException():
return formatException(_that);case SerializationException():
return serializationException(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CancelException value)?  cancelException,TResult? Function( ConnectionTimeoutException value)?  connectionTimeoutException,TResult? Function( ReceiveTimeoutException value)?  receiveTimeoutException,TResult? Function( SendTimeoutException value)?  sendTimeoutException,TResult? Function( SocketException value)?  socketException,TResult? Function( UnrecognizedException value)?  unrecognizedException,TResult? Function( TokenEpiredException value)?  tokenExpiredException,TResult? Function( ServerException value)?  serverException,TResult? Function( FormatException value)?  formatException,TResult? Function( SerializationException value)?  serializationException,}){
final _that = this;
switch (_that) {
case CancelException() when cancelException != null:
return cancelException(_that);case ConnectionTimeoutException() when connectionTimeoutException != null:
return connectionTimeoutException(_that);case ReceiveTimeoutException() when receiveTimeoutException != null:
return receiveTimeoutException(_that);case SendTimeoutException() when sendTimeoutException != null:
return sendTimeoutException(_that);case SocketException() when socketException != null:
return socketException(_that);case UnrecognizedException() when unrecognizedException != null:
return unrecognizedException(_that);case TokenEpiredException() when tokenExpiredException != null:
return tokenExpiredException(_that);case ServerException() when serverException != null:
return serverException(_that);case FormatException() when formatException != null:
return formatException(_that);case SerializationException() when serializationException != null:
return serializationException(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  cancelException,TResult Function( String message)?  connectionTimeoutException,TResult Function( String message)?  receiveTimeoutException,TResult Function( String message)?  sendTimeoutException,TResult Function( String message)?  socketException,TResult Function( String message)?  unrecognizedException,TResult Function( String message)?  tokenExpiredException,TResult Function( String message,  int statusCode,  dynamic data)?  serverException,TResult Function( String message)?  formatException,TResult Function( String message)?  serializationException,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CancelException() when cancelException != null:
return cancelException(_that.message);case ConnectionTimeoutException() when connectionTimeoutException != null:
return connectionTimeoutException(_that.message);case ReceiveTimeoutException() when receiveTimeoutException != null:
return receiveTimeoutException(_that.message);case SendTimeoutException() when sendTimeoutException != null:
return sendTimeoutException(_that.message);case SocketException() when socketException != null:
return socketException(_that.message);case UnrecognizedException() when unrecognizedException != null:
return unrecognizedException(_that.message);case TokenEpiredException() when tokenExpiredException != null:
return tokenExpiredException(_that.message);case ServerException() when serverException != null:
return serverException(_that.message,_that.statusCode,_that.data);case FormatException() when formatException != null:
return formatException(_that.message);case SerializationException() when serializationException != null:
return serializationException(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  cancelException,required TResult Function( String message)  connectionTimeoutException,required TResult Function( String message)  receiveTimeoutException,required TResult Function( String message)  sendTimeoutException,required TResult Function( String message)  socketException,required TResult Function( String message)  unrecognizedException,required TResult Function( String message)  tokenExpiredException,required TResult Function( String message,  int statusCode,  dynamic data)  serverException,required TResult Function( String message)  formatException,required TResult Function( String message)  serializationException,}) {final _that = this;
switch (_that) {
case CancelException():
return cancelException(_that.message);case ConnectionTimeoutException():
return connectionTimeoutException(_that.message);case ReceiveTimeoutException():
return receiveTimeoutException(_that.message);case SendTimeoutException():
return sendTimeoutException(_that.message);case SocketException():
return socketException(_that.message);case UnrecognizedException():
return unrecognizedException(_that.message);case TokenEpiredException():
return tokenExpiredException(_that.message);case ServerException():
return serverException(_that.message,_that.statusCode,_that.data);case FormatException():
return formatException(_that.message);case SerializationException():
return serializationException(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  cancelException,TResult? Function( String message)?  connectionTimeoutException,TResult? Function( String message)?  receiveTimeoutException,TResult? Function( String message)?  sendTimeoutException,TResult? Function( String message)?  socketException,TResult? Function( String message)?  unrecognizedException,TResult? Function( String message)?  tokenExpiredException,TResult? Function( String message,  int statusCode,  dynamic data)?  serverException,TResult? Function( String message)?  formatException,TResult? Function( String message)?  serializationException,}) {final _that = this;
switch (_that) {
case CancelException() when cancelException != null:
return cancelException(_that.message);case ConnectionTimeoutException() when connectionTimeoutException != null:
return connectionTimeoutException(_that.message);case ReceiveTimeoutException() when receiveTimeoutException != null:
return receiveTimeoutException(_that.message);case SendTimeoutException() when sendTimeoutException != null:
return sendTimeoutException(_that.message);case SocketException() when socketException != null:
return socketException(_that.message);case UnrecognizedException() when unrecognizedException != null:
return unrecognizedException(_that.message);case TokenEpiredException() when tokenExpiredException != null:
return tokenExpiredException(_that.message);case ServerException() when serverException != null:
return serverException(_that.message,_that.statusCode,_that.data);case FormatException() when formatException != null:
return formatException(_that.message);case SerializationException() when serializationException != null:
return serializationException(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CancelException extends Failure {
  const CancelException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelExceptionCopyWith<CancelException> get copyWith => _$CancelExceptionCopyWithImpl<CancelException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.cancelException(message: $message)';
}


}

/// @nodoc
abstract mixin class $CancelExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CancelExceptionCopyWith(CancelException value, $Res Function(CancelException) _then) = _$CancelExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CancelExceptionCopyWithImpl<$Res>
    implements $CancelExceptionCopyWith<$Res> {
  _$CancelExceptionCopyWithImpl(this._self, this._then);

  final CancelException _self;
  final $Res Function(CancelException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CancelException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConnectionTimeoutException extends Failure {
  const ConnectionTimeoutException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionTimeoutExceptionCopyWith<ConnectionTimeoutException> get copyWith => _$ConnectionTimeoutExceptionCopyWithImpl<ConnectionTimeoutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionTimeoutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.connectionTimeoutException(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConnectionTimeoutExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ConnectionTimeoutExceptionCopyWith(ConnectionTimeoutException value, $Res Function(ConnectionTimeoutException) _then) = _$ConnectionTimeoutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConnectionTimeoutExceptionCopyWithImpl<$Res>
    implements $ConnectionTimeoutExceptionCopyWith<$Res> {
  _$ConnectionTimeoutExceptionCopyWithImpl(this._self, this._then);

  final ConnectionTimeoutException _self;
  final $Res Function(ConnectionTimeoutException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConnectionTimeoutException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReceiveTimeoutException extends Failure {
  const ReceiveTimeoutException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveTimeoutExceptionCopyWith<ReceiveTimeoutException> get copyWith => _$ReceiveTimeoutExceptionCopyWithImpl<ReceiveTimeoutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveTimeoutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.receiveTimeoutException(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveTimeoutExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ReceiveTimeoutExceptionCopyWith(ReceiveTimeoutException value, $Res Function(ReceiveTimeoutException) _then) = _$ReceiveTimeoutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReceiveTimeoutExceptionCopyWithImpl<$Res>
    implements $ReceiveTimeoutExceptionCopyWith<$Res> {
  _$ReceiveTimeoutExceptionCopyWithImpl(this._self, this._then);

  final ReceiveTimeoutException _self;
  final $Res Function(ReceiveTimeoutException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveTimeoutException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SendTimeoutException extends Failure {
  const SendTimeoutException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendTimeoutExceptionCopyWith<SendTimeoutException> get copyWith => _$SendTimeoutExceptionCopyWithImpl<SendTimeoutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeoutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.sendTimeoutException(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendTimeoutExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $SendTimeoutExceptionCopyWith(SendTimeoutException value, $Res Function(SendTimeoutException) _then) = _$SendTimeoutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendTimeoutExceptionCopyWithImpl<$Res>
    implements $SendTimeoutExceptionCopyWith<$Res> {
  _$SendTimeoutExceptionCopyWithImpl(this._self, this._then);

  final SendTimeoutException _self;
  final $Res Function(SendTimeoutException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendTimeoutException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SocketException extends Failure {
  const SocketException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocketExceptionCopyWith<SocketException> get copyWith => _$SocketExceptionCopyWithImpl<SocketException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocketException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.socketException(message: $message)';
}


}

/// @nodoc
abstract mixin class $SocketExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $SocketExceptionCopyWith(SocketException value, $Res Function(SocketException) _then) = _$SocketExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SocketExceptionCopyWithImpl<$Res>
    implements $SocketExceptionCopyWith<$Res> {
  _$SocketExceptionCopyWithImpl(this._self, this._then);

  final SocketException _self;
  final $Res Function(SocketException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SocketException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnrecognizedException extends Failure {
  const UnrecognizedException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnrecognizedExceptionCopyWith<UnrecognizedException> get copyWith => _$UnrecognizedExceptionCopyWithImpl<UnrecognizedException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnrecognizedException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unrecognizedException(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnrecognizedExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnrecognizedExceptionCopyWith(UnrecognizedException value, $Res Function(UnrecognizedException) _then) = _$UnrecognizedExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnrecognizedExceptionCopyWithImpl<$Res>
    implements $UnrecognizedExceptionCopyWith<$Res> {
  _$UnrecognizedExceptionCopyWithImpl(this._self, this._then);

  final UnrecognizedException _self;
  final $Res Function(UnrecognizedException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnrecognizedException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TokenEpiredException extends Failure {
  const TokenEpiredException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenEpiredExceptionCopyWith<TokenEpiredException> get copyWith => _$TokenEpiredExceptionCopyWithImpl<TokenEpiredException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenEpiredException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.tokenExpiredException(message: $message)';
}


}

/// @nodoc
abstract mixin class $TokenEpiredExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $TokenEpiredExceptionCopyWith(TokenEpiredException value, $Res Function(TokenEpiredException) _then) = _$TokenEpiredExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TokenEpiredExceptionCopyWithImpl<$Res>
    implements $TokenEpiredExceptionCopyWith<$Res> {
  _$TokenEpiredExceptionCopyWithImpl(this._self, this._then);

  final TokenEpiredException _self;
  final $Res Function(TokenEpiredException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TokenEpiredException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerException extends Failure {
  const ServerException({required this.message, required this.statusCode, this.data}): super._();
  

@override final  String message;
 final  int statusCode;
 final  dynamic data;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Failure.serverException(message: $message, statusCode: $statusCode, data: $data)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, int statusCode, dynamic data
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = null,Object? data = freezed,}) {
  return _then(ServerException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class FormatException extends Failure {
  const FormatException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormatExceptionCopyWith<FormatException> get copyWith => _$FormatExceptionCopyWithImpl<FormatException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.formatException(message: $message)';
}


}

/// @nodoc
abstract mixin class $FormatExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $FormatExceptionCopyWith(FormatException value, $Res Function(FormatException) _then) = _$FormatExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FormatExceptionCopyWithImpl<$Res>
    implements $FormatExceptionCopyWith<$Res> {
  _$FormatExceptionCopyWithImpl(this._self, this._then);

  final FormatException _self;
  final $Res Function(FormatException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FormatException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SerializationException extends Failure {
  const SerializationException({required this.message}): super._();
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SerializationExceptionCopyWith<SerializationException> get copyWith => _$SerializationExceptionCopyWithImpl<SerializationException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SerializationException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.serializationException(message: $message)';
}


}

/// @nodoc
abstract mixin class $SerializationExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $SerializationExceptionCopyWith(SerializationException value, $Res Function(SerializationException) _then) = _$SerializationExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SerializationExceptionCopyWithImpl<$Res>
    implements $SerializationExceptionCopyWith<$Res> {
  _$SerializationExceptionCopyWithImpl(this._self, this._then);

  final SerializationException _self;
  final $Res Function(SerializationException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SerializationException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
