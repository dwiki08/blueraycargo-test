// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ErrorResult {

  String? get message;

  int? get code;

  Exception? get exception;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorResultCopyWith<ErrorResult> get copyWith =>
      _$ErrorResultCopyWithImpl<ErrorResult>(this as ErrorResult, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorResult &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message, code, exception);

  @override
  String toString() {
    return 'ErrorResult(message: $message, code: $code, exception: $exception)';
  }


}

/// @nodoc
abstract mixin class $ErrorResultCopyWith<$Res> {
  factory $ErrorResultCopyWith(ErrorResult value,
      $Res Function(ErrorResult) _then) = _$ErrorResultCopyWithImpl;

  @useResult
  $Res call({
    String? message, int? code, Exception? exception
  });


}

/// @nodoc
class _$ErrorResultCopyWithImpl<$Res>
    implements $ErrorResultCopyWith<$Res> {
  _$ErrorResultCopyWithImpl(this._self, this._then);

  final ErrorResult _self;
  final $Res Function(ErrorResult) _then;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? message = freezed, Object? code = freezed, Object? exception = freezed,}) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
      as int?,
      exception: freezed == exception
          ? _self.exception
          : exception // ignore: cast_nullable_to_non_nullable
      as Exception?,
    ));
  }

}


/// @nodoc


class _ErrorResult implements ErrorResult {
  const _ErrorResult({this.message, this.code, this.exception});


  @override final String? message;
  @override final int? code;
  @override final Exception? exception;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorResultCopyWith<_ErrorResult> get copyWith =>
      __$ErrorResultCopyWithImpl<_ErrorResult>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ErrorResult &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message, code, exception);

  @override
  String toString() {
    return 'ErrorResult(message: $message, code: $code, exception: $exception)';
  }


}

/// @nodoc
abstract mixin class _$ErrorResultCopyWith<$Res>
    implements $ErrorResultCopyWith<$Res> {
  factory _$ErrorResultCopyWith(_ErrorResult value,
      $Res Function(_ErrorResult) _then) = __$ErrorResultCopyWithImpl;

  @override
  @useResult
  $Res call({
    String? message, int? code, Exception? exception
  });


}

/// @nodoc
class __$ErrorResultCopyWithImpl<$Res>
    implements _$ErrorResultCopyWith<$Res> {
  __$ErrorResultCopyWithImpl(this._self, this._then);

  final _ErrorResult _self;
  final $Res Function(_ErrorResult) _then;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? message = freezed, Object? code = freezed, Object? exception = freezed,}) {
    return _then(_ErrorResult(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
      as int?,
      exception: freezed == exception
          ? _self.exception
          : exception // ignore: cast_nullable_to_non_nullable
      as Exception?,
    ));
  }


}

// dart format on
