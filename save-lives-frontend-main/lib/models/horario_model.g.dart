// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HorarioModel _$HorarioModelFromJson(Map<String, dynamic> json) => HorarioModel(
      id: json['id'] as int?,
      bloodCenterId: json['bloodCenterId'] as int?,
      day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    )..cpf = json['cpf'] as String?;

Map<String, dynamic> _$HorarioModelToJson(HorarioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bloodCenterId': instance.bloodCenterId,
      'day': instance.day?.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'cpf': instance.cpf,
    };
