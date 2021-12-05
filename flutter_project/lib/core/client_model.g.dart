// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Client _$$_ClientFromJson(Map<String, dynamic> json) => _$_Client(
      id: json['id'] as int?,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      adress: json['adress'] as String,
      package: json['package'] as String,
    );

Map<String, dynamic> _$$_ClientToJson(_$_Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'adress': instance.adress,
      'package': instance.package,
    };
