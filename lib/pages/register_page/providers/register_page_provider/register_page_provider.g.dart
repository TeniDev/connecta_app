// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_page_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterPageModel _$$_RegisterPageModelFromJson(Map<String, dynamic> json) =>
    _$_RegisterPageModel(
      isObscurePassword: json['isObscurePassword'] as bool,
      isLoadingForm: json['isLoadingForm'] as bool,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$$_RegisterPageModelToJson(
        _$_RegisterPageModel instance) =>
    <String, dynamic>{
      'isObscurePassword': instance.isObscurePassword,
      'isLoadingForm': instance.isLoadingForm,
      'birthday': instance.birthday?.toIso8601String(),
    };
