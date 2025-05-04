// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginFormState {
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  Either<String, dynamic>? get apiResponse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call(
      {EmailAddress email,
      Password password,
      bool isSubmitting,
      bool isValid,
      Either<String, dynamic>? apiResponse});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isSubmitting = null,
    Object? isValid = null,
    Object? apiResponse = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      apiResponse: freezed == apiResponse
          ? _value.apiResponse
          : apiResponse // ignore: cast_nullable_to_non_nullable
              as Either<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginFormStateImplCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$LoginFormStateImplCopyWith(_$LoginFormStateImpl value,
          $Res Function(_$LoginFormStateImpl) then) =
      __$$LoginFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress email,
      Password password,
      bool isSubmitting,
      bool isValid,
      Either<String, dynamic>? apiResponse});
}

/// @nodoc
class __$$LoginFormStateImplCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$LoginFormStateImpl>
    implements _$$LoginFormStateImplCopyWith<$Res> {
  __$$LoginFormStateImplCopyWithImpl(
      _$LoginFormStateImpl _value, $Res Function(_$LoginFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isSubmitting = null,
    Object? isValid = null,
    Object? apiResponse = freezed,
  }) {
    return _then(_$LoginFormStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      apiResponse: freezed == apiResponse
          ? _value.apiResponse
          : apiResponse // ignore: cast_nullable_to_non_nullable
              as Either<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoginFormStateImpl extends _LoginFormState {
  const _$LoginFormStateImpl(
      {required this.email,
      required this.password,
      required this.isSubmitting,
      required this.isValid,
      this.apiResponse})
      : super._();

  @override
  final EmailAddress email;
  @override
  final Password password;
  @override
  final bool isSubmitting;
  @override
  final bool isValid;
  @override
  final Either<String, dynamic>? apiResponse;

  @override
  String toString() {
    return 'LoginFormState(email: $email, password: $password, isSubmitting: $isSubmitting, isValid: $isValid, apiResponse: $apiResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.apiResponse, apiResponse) ||
                other.apiResponse == apiResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, password, isSubmitting, isValid, apiResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      __$$LoginFormStateImplCopyWithImpl<_$LoginFormStateImpl>(
          this, _$identity);
}

abstract class _LoginFormState extends LoginFormState {
  const factory _LoginFormState(
      {required final EmailAddress email,
      required final Password password,
      required final bool isSubmitting,
      required final bool isValid,
      final Either<String, dynamic>? apiResponse}) = _$LoginFormStateImpl;
  const _LoginFormState._() : super._();

  @override
  EmailAddress get email;
  @override
  Password get password;
  @override
  bool get isSubmitting;
  @override
  bool get isValid;
  @override
  Either<String, dynamic>? get apiResponse;
  @override
  @JsonKey(ignore: true)
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
