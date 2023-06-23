// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_address_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditAddressPageModel _$EditAddressPageModelFromJson(Map<String, dynamic> json) {
  return _EditAddressPageModel.fromJson(json);
}

/// @nodoc
mixin _$EditAddressPageModel {
  bool get isLoadingForm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditAddressPageModelCopyWith<EditAddressPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAddressPageModelCopyWith<$Res> {
  factory $EditAddressPageModelCopyWith(EditAddressPageModel value,
          $Res Function(EditAddressPageModel) then) =
      _$EditAddressPageModelCopyWithImpl<$Res, EditAddressPageModel>;
  @useResult
  $Res call({bool isLoadingForm});
}

/// @nodoc
class _$EditAddressPageModelCopyWithImpl<$Res,
        $Val extends EditAddressPageModel>
    implements $EditAddressPageModelCopyWith<$Res> {
  _$EditAddressPageModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_EditAddressPageModelCopyWith<$Res>
    implements $EditAddressPageModelCopyWith<$Res> {
  factory _$$_EditAddressPageModelCopyWith(_$_EditAddressPageModel value,
          $Res Function(_$_EditAddressPageModel) then) =
      __$$_EditAddressPageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoadingForm});
}

/// @nodoc
class __$$_EditAddressPageModelCopyWithImpl<$Res>
    extends _$EditAddressPageModelCopyWithImpl<$Res, _$_EditAddressPageModel>
    implements _$$_EditAddressPageModelCopyWith<$Res> {
  __$$_EditAddressPageModelCopyWithImpl(_$_EditAddressPageModel _value,
      $Res Function(_$_EditAddressPageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingForm = null,
  }) {
    return _then(_$_EditAddressPageModel(
      isLoadingForm: null == isLoadingForm
          ? _value.isLoadingForm
          : isLoadingForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditAddressPageModel implements _EditAddressPageModel {
  const _$_EditAddressPageModel({required this.isLoadingForm});

  factory _$_EditAddressPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_EditAddressPageModelFromJson(json);

  @override
  final bool isLoadingForm;

  @override
  String toString() {
    return 'EditAddressPageModel(isLoadingForm: $isLoadingForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditAddressPageModel &&
            (identical(other.isLoadingForm, isLoadingForm) ||
                other.isLoadingForm == isLoadingForm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoadingForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditAddressPageModelCopyWith<_$_EditAddressPageModel> get copyWith =>
      __$$_EditAddressPageModelCopyWithImpl<_$_EditAddressPageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditAddressPageModelToJson(
      this,
    );
  }
}

abstract class _EditAddressPageModel implements EditAddressPageModel {
  const factory _EditAddressPageModel({required final bool isLoadingForm}) =
      _$_EditAddressPageModel;

  factory _EditAddressPageModel.fromJson(Map<String, dynamic> json) =
      _$_EditAddressPageModel.fromJson;

  @override
  bool get isLoadingForm;
  @override
  @JsonKey(ignore: true)
  _$$_EditAddressPageModelCopyWith<_$_EditAddressPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
