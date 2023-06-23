// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      id: json['id'] as String,
      identifierName: json['identifierName'] as String?,
      address: json['address'] as String,
      complement: json['complement'] as String?,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifierName': instance.identifierName,
      'address': instance.address,
      'complement': instance.complement,
      'city': instance.city,
    };
