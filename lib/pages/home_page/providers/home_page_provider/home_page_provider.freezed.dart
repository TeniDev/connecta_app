// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageModel _$HomePageModelFromJson(Map<String, dynamic> json) {
  return _HomePageModel.fromJson(json);
}

/// @nodoc
mixin _$HomePageModel {
  bool get isLoadingSignOut => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageModelCopyWith<HomePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageModelCopyWith<$Res> {
  factory $HomePageModelCopyWith(
          HomePageModel value, $Res Function(HomePageModel) then) =
      _$HomePageModelCopyWithImpl<$Res, HomePageModel>;
  @useResult
  $Res call({bool isLoadingSignOut, bool isSearching});
}

/// @nodoc
class _$HomePageModelCopyWithImpl<$Res, $Val extends HomePageModel>
    implements $HomePageModelCopyWith<$Res> {
  _$HomePageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingSignOut = null,
    Object? isSearching = null,
  }) {
    return _then(_value.copyWith(
      isLoadingSignOut: null == isLoadingSignOut
          ? _value.isLoadingSignOut
          : isLoadingSignOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomePageModelCopyWith<$Res>
    implements $HomePageModelCopyWith<$Res> {
  factory _$$_HomePageModelCopyWith(
          _$_HomePageModel value, $Res Function(_$_HomePageModel) then) =
      __$$_HomePageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoadingSignOut, bool isSearching});
}

/// @nodoc
class __$$_HomePageModelCopyWithImpl<$Res>
    extends _$HomePageModelCopyWithImpl<$Res, _$_HomePageModel>
    implements _$$_HomePageModelCopyWith<$Res> {
  __$$_HomePageModelCopyWithImpl(
      _$_HomePageModel _value, $Res Function(_$_HomePageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingSignOut = null,
    Object? isSearching = null,
  }) {
    return _then(_$_HomePageModel(
      isLoadingSignOut: null == isLoadingSignOut
          ? _value.isLoadingSignOut
          : isLoadingSignOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomePageModel implements _HomePageModel {
  const _$_HomePageModel(
      {required this.isLoadingSignOut, required this.isSearching});

  factory _$_HomePageModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageModelFromJson(json);

  @override
  final bool isLoadingSignOut;
  @override
  final bool isSearching;

  @override
  String toString() {
    return 'HomePageModel(isLoadingSignOut: $isLoadingSignOut, isSearching: $isSearching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageModel &&
            (identical(other.isLoadingSignOut, isLoadingSignOut) ||
                other.isLoadingSignOut == isLoadingSignOut) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoadingSignOut, isSearching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageModelCopyWith<_$_HomePageModel> get copyWith =>
      __$$_HomePageModelCopyWithImpl<_$_HomePageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageModelToJson(
      this,
    );
  }
}

abstract class _HomePageModel implements HomePageModel {
  const factory _HomePageModel(
      {required final bool isLoadingSignOut,
      required final bool isSearching}) = _$_HomePageModel;

  factory _HomePageModel.fromJson(Map<String, dynamic> json) =
      _$_HomePageModel.fromJson;

  @override
  bool get isLoadingSignOut;
  @override
  bool get isSearching;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageModelCopyWith<_$_HomePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
