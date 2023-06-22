// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterPageModel _$RegisterPageModelFromJson(Map<String, dynamic> json) {
  return _RegisterPageModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterPageModel {
  bool get isObscurePassword => throw _privateConstructorUsedError;
  bool get isLoadingForm => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterPageModelCopyWith<RegisterPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPageModelCopyWith<$Res> {
  factory $RegisterPageModelCopyWith(
          RegisterPageModel value, $Res Function(RegisterPageModel) then) =
      _$RegisterPageModelCopyWithImpl<$Res, RegisterPageModel>;
  @useResult
  $Res call({bool isObscurePassword, bool isLoadingForm, DateTime? birthday});
}

/// @nodoc
class _$RegisterPageModelCopyWithImpl<$Res, $Val extends RegisterPageModel>
    implements $RegisterPageModelCopyWith<$Res> {
  _$RegisterPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscurePassword = null,
    Object? isLoadingForm = null,
    Object? birthday = freezed,
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
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterPageModelCopyWith<$Res>
    implements $RegisterPageModelCopyWith<$Res> {
  factory _$$_RegisterPageModelCopyWith(_$_RegisterPageModel value,
          $Res Function(_$_RegisterPageModel) then) =
      __$$_RegisterPageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isObscurePassword, bool isLoadingForm, DateTime? birthday});
}

/// @nodoc
class __$$_RegisterPageModelCopyWithImpl<$Res>
    extends _$RegisterPageModelCopyWithImpl<$Res, _$_RegisterPageModel>
    implements _$$_RegisterPageModelCopyWith<$Res> {
  __$$_RegisterPageModelCopyWithImpl(
      _$_RegisterPageModel _value, $Res Function(_$_RegisterPageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObscurePassword = null,
    Object? isLoadingForm = null,
    Object? birthday = freezed,
  }) {
    return _then(_$_RegisterPageModel(
      isObscurePassword: null == isObscurePassword
          ? _value.isObscurePassword
          : isObscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForm: null == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterPageModel implements _RegisterPageModel {
  const _$_RegisterPageModel(
      {required this.isObscurePassword,
      required this.isLoadingForm,
      this.birthday});

  factory _$_RegisterPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterPageModelFromJson(json);

  @override
  final bool isObscurePassword;
  @override
  final bool isLoadingForm;
  @override
  final DateTime? birthday;

  @override
  String toString() {
    return 'RegisterPageModel(isObscurePassword: $isObscurePassword, isLoadingForm: $isLoadingForm, birthday: $birthday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterPageModel &&
            (identical(other.isObscurePassword, isObscurePassword) ||
                other.isObscurePassword == isObscurePassword) &&
            (identical(other.isLoadingForm, isLoadingForm) ||
                other.isLoadingForm == isLoadingForm) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isObscurePassword, isLoadingForm, birthday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterPageModelCopyWith<_$_RegisterPageModel> get copyWith =>
      __$$_RegisterPageModelCopyWithImpl<_$_RegisterPageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterPageModelToJson(
      this,
    );
  }
}

abstract class _RegisterPageModel implements RegisterPageModel {
  const factory _RegisterPageModel(
      {required final bool isObscurePassword,
      required final bool isLoadingForm,
      final DateTime? birthday}) = _$_RegisterPageModel;

  factory _RegisterPageModel.fromJson(Map<String, dynamic> json) =
      _$_RegisterPageModel.fromJson;

  @override
  bool get isObscurePassword;
  @override
  bool get isLoadingForm;
  @override
  DateTime? get birthday;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterPageModelCopyWith<_$_RegisterPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
