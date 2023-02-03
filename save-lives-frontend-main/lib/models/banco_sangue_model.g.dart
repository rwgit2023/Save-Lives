// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banco_sangue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BancoSangueModel _$BancoSangueModelFromJson(Map<String, dynamic> json) =>
    BancoSangueModel(
      id: json['id'] as int?,
      bloodCenterId: json['bloodCenterId'] as int?,
      status: json['status'] as String?,
      bloodType: json['bloodType'] as String?,
    );

Map<String, dynamic> _$BancoSangueModelToJson(BancoSangueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'bloodType': instance.bloodType,
      'bloodCenterId': instance.bloodCenterId,
    };
