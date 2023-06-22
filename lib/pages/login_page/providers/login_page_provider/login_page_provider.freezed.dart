// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginPageModel _$LoginPageModelFromJson(Map<String, dynamic> json) {
  return _LoginPageModel.fromJson(json);
}

/// @nodoc
mixin _$LoginPageModel {
  bool get isObscurePassword => throw _privateConstructorUsedError;
  bool get isLoadingForm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginPageModelCopyWith<LoginPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageModelCopyWith<$Res> {
  factory $LoginPageModelCopyWith(
          LoginPageModel value, $Res Function(LoginPageModel) then) =
      _$LoginPageModelCopyWithImpl<$Res, LoginPageModel>;
  @useResult
  $Res call({bool isObscurePassword, bool isLoadingForm});
}

/// @nodoc
class _$LoginPageModelCopyWithImpl<$Res, $Val extends LoginPageModel>
    implements $LoginPageModelCopyWith<$Res> {
  _$LoginPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscurePassword = null,
    Object? isLoadingForm = null,
  }) {
    return _then(_value.copyWith(
      isObscurePassword: null == isObscurePassword
          ? _value.isObscurePassword
          : isObscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForm: null == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginPageModelCopyWith<$Res>
    implements $LoginPageModelCopyWith<$Res> {
  factory _$$_LoginPageModelCopyWith(
          _$_LoginPageModel value, $Res Function(_$_LoginPageModel) then) =
      __$$_LoginPageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isObscurePassword, bool isLoadingForm});
}

/// @nodoc
class __$$_LoginPageModelCopyWithImpl<$Res>
    extends _$LoginPageModelCopyWithImpl<$Res, _$_LoginPageModel>
    implements _$$_LoginPageModelCopyWith<$Res> {
  __$$_LoginPageModelCopyWithImpl(
      _$_LoginPageModel _value, $Res Function(_$_LoginPageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscurePassword = null,
    Object? isLoadingForm = null,
  }) {
    return _then(_$_LoginPageModel(
      isObscurePassword: null == isObscurePassword
          ? _value.isObscurePassword
          : isObscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForm: null == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginPageModel implements _LoginPageModel {
  const _$_LoginPageModel(
      {required this.isObscurePassword, required this.isLoadingForm});

  factory _$_LoginPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginPageModelFromJson(json);

  @override
  final bool isObscurePassword;
  @override
  final bool isLoadingForm;

  @override
  String toString() {
    return 'LoginPageModel(isObscurePassword: $isObscurePassword, isLoadingForm: $isLoadingForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginPageModel &&
            (identical(other.isObscurePassword, isObscurePassword) ||
                other.isObscurePassword == isObscurePassword) &&
            (identical(other.isLoadingForm, isLoadingForm) ||
                other.isLoadingForm == isLoadingForm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isObscurePassword, isLoadingForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginPageModelCopyWith<_$_LoginPageModel> get copyWith =>
      __$$_LoginPageModelCopyWithImpl<_$_LoginPageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginPageModelToJson(
      this,
    );
  }
}

abstract class _LoginPageModel implements LoginPageModel {
  const factory _LoginPageModel(
      {required final bool isObscurePassword,
      required final bool isLoadingForm}) = _$_LoginPageModel;

  factory _LoginPageModel.fromJson(Map<String, dynamic> json) =
      _$_LoginPageModel.fromJson;

  @override
  bool get isObscurePassword;
  @override
  bool get isLoadingForm;
  @override
  @JsonKey(ignore: true)
  _$$_LoginPageModelCopyWith<_$_LoginPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
