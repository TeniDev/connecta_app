// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_address_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateAddressPageModel _$CreateAddressPageModelFromJson(
    Map<String, dynamic> json) {
  return _CreateAddressPageModel.fromJson(json);
}

/// @nodoc
mixin _$CreateAddressPageModel {
  bool get isLoadingForm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateAddressPageModelCopyWith<CreateAddressPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAddressPageModelCopyWith<$Res> {
  factory $CreateAddressPageModelCopyWith(CreateAddressPageModel value,
          $Res Function(CreateAddressPageModel) then) =
      _$CreateAddressPageModelCopyWithImpl<$Res, CreateAddressPageModel>;
  @useResult
  $Res call({bool isLoadingForm});
}

/// @nodoc
class _$CreateAddressPageModelCopyWithImpl<$Res,
        $Val extends CreateAddressPageModel>
    implements $CreateAddressPageModelCopyWith<$Res> {
  _$CreateAddressPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingForm = null,
  }) {
    return _then(_value.copyWith(
      isLoadingForm: null == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateAddressPageModelCopyWith<$Res>
    implements $CreateAddressPageModelCopyWith<$Res> {
  factory _$$_CreateAddressPageModelCopyWith(_$_CreateAddressPageModel value,
          $Res Function(_$_CreateAddressPageModel) then) =
      __$$_CreateAddressPageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoadingForm});
}

/// @nodoc
class __$$_CreateAddressPageModelCopyWithImpl<$Res>
    extends _$CreateAddressPageModelCopyWithImpl<$Res,
        _$_CreateAddressPageModel>
    implements _$$_CreateAddressPageModelCopyWith<$Res> {
  __$$_CreateAddressPageModelCopyWithImpl(_$_CreateAddressPageModel _value,
      $Res Function(_$_CreateAddressPageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingForm = null,
  }) {
    return _then(_$_CreateAddressPageModel(
      isLoadingForm: null == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateAddressPageModel implements _CreateAddressPageModel {
  const _$_CreateAddressPageModel({required this.isLoadingForm});

  factory _$_CreateAddressPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreateAddressPageModelFromJson(json);

  @override
  final bool isLoadingForm;

  @override
  String toString() {
    return 'CreateAddressPageModel(isLoadingForm: $isLoadingForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAddressPageModel &&
            (identical(other.isLoadingForm, isLoadingForm) ||
                other.isLoadingForm == isLoadingForm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoadingForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateAddressPageModelCopyWith<_$_CreateAddressPageModel> get copyWith =>
      __$$_CreateAddressPageModelCopyWithImpl<_$_CreateAddressPageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateAddressPageModelToJson(
      this,
    );
  }
}

abstract class _CreateAddressPageModel implements CreateAddressPageModel {
  const factory _CreateAddressPageModel({required final bool isLoadingForm}) =
      _$_CreateAddressPageModel;

  factory _CreateAddressPageModel.fromJson(Map<String, dynamic> json) =
      _$_CreateAddressPageModel.fromJson;

  @override
  bool get isLoadingForm;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAddressPageModelCopyWith<_$_CreateAddressPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
