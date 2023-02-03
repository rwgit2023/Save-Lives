// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criticity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriticityModel _$CriticityModelFromJson(Map<String, dynamic> json) =>
    CriticityModel(
      id: json['id'] as int?,
      bloodCenterId: json['bloodCenterId'] as int?,
      bloodType: json['bloodType'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CriticityModelToJson(CriticityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bloodCenterId': instance.bloodCenterId,
      'bloodType': instance.bloodType,
      'status': instance.status,
    };
