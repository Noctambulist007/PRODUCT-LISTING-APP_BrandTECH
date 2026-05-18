// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductUiState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductUiState()';
}


}

/// @nodoc
class $ProductUiStateCopyWith<$Res>  {
$ProductUiStateCopyWith(ProductUiState _, $Res Function(ProductUiState) __);
}


/// Adds pattern-matching-related methods to [ProductUiState].
extension ProductUiStatePatterns on ProductUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialState value)?  initial,TResult Function( LoadingState value)?  loading,TResult Function( SuccessState value)?  success,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial(_that);case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialState value)  initial,required TResult Function( LoadingState value)  loading,required TResult Function( SuccessState value)  success,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case InitialState():
return initial(_that);case LoadingState():
return loading(_that);case SuccessState():
return success(_that);case ErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialState value)?  initial,TResult? Function( LoadingState value)?  loading,TResult? Function( SuccessState value)?  success,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial(_that);case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Product> products,  List<Product> filtered,  ProductSort sort,  bool hasMore,  bool isLoadingMore)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial();case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.products,_that.filtered,_that.sort,_that.hasMore,_that.isLoadingMore);case ErrorState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Product> products,  List<Product> filtered,  ProductSort sort,  bool hasMore,  bool isLoadingMore)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InitialState():
return initial();case LoadingState():
return loading();case SuccessState():
return success(_that.products,_that.filtered,_that.sort,_that.hasMore,_that.isLoadingMore);case ErrorState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Product> products,  List<Product> filtered,  ProductSort sort,  bool hasMore,  bool isLoadingMore)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial();case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.products,_that.filtered,_that.sort,_that.hasMore,_that.isLoadingMore);case ErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InitialState implements ProductUiState {
  const InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductUiState.initial()';
}


}




/// @nodoc


class LoadingState implements ProductUiState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductUiState.loading()';
}


}




/// @nodoc


class SuccessState implements ProductUiState {
  const SuccessState({required final  List<Product> products, required final  List<Product> filtered, this.sort = ProductSort.none, this.hasMore = true, this.isLoadingMore = false}): _products = products,_filtered = filtered;
  

 final  List<Product> _products;
 List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<Product> _filtered;
 List<Product> get filtered {
  if (_filtered is EqualUnmodifiableListView) return _filtered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filtered);
}

@JsonKey() final  ProductSort sort;
@JsonKey() final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of ProductUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._filtered, _filtered)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_filtered),sort,hasMore,isLoadingMore);

@override
String toString() {
  return 'ProductUiState.success(products: $products, filtered: $filtered, sort: $sort, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $ProductUiStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<Product> products, List<Product> filtered, ProductSort sort, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of ProductUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? filtered = null,Object? sort = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(SuccessState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,filtered: null == filtered ? _self._filtered : filtered // ignore: cast_nullable_to_non_nullable
as List<Product>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ProductSort,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ErrorState implements ProductUiState {
  const ErrorState(this.message);
  

 final  String message;

/// Create a copy of ProductUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductUiState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $ProductUiStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of ProductUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
