// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulesModel _$SchedulesModelFromJson(Map<String, dynamic> json) =>
    SchedulesModel(
      id: json['id'] as int?,
      donorId: json['donorId'] as int?,
      bloodCenterId: json['bloodCenterId'] as int?,
      scheduleId: json['scheduleId'] as int?,
      scheduleDate: json['scheduleDate'] == null
          ? null
          : DateTime.parse(json['scheduleDate'] as String),
      startTime: json['startTime'] as String?,
      username: json['username'] as String?,
      userCpf: json['userCpf'] as String?,
      userPhone: json['userPhone'] as String?,
      donorStreet: json['donorStreet'] as String?,
      donorCity: json['donorCity'] as String?,
      bloodCenterCnpj: json['bloodCenterCnpj'] as String?,
      bloodCenterName: json['bloodCenterName'] as String?,
      bloodCenterPhone: json['bloodCenterPhone'] as String?,
      bloodCenterStreet: json['bloodCenterStreet'] as String?,
      bloodCenterCity: json['bloodCenterCity'] as String?,
      canCancel: json['canCancel'] as bool?,
    );

Map<String, dynamic> _$SchedulesModelToJson(SchedulesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'donorId': instance.donorId,
      'bloodCenterId': instance.bloodCenterId,
      'scheduleId': instance.scheduleId,
      'scheduleDate': instance.scheduleDate?.toIso8601String(),
      'startTime': instance.startTime,
      'username': instance.username,
      'userCpf': instance.userCpf,
      'userPhone': instance.userPhone,
      'donorStreet': instance.donorStreet,
      'donorCity': instance.donorCity,
      'bloodCenterCnpj': instance.bloodCenterCnpj,
      'bloodCenterName': instance.bloodCenterName,
      'bloodCenterPhone': instance.bloodCenterPhone,
      'bloodCenterStreet': instance.bloodCenterStreet,
      'bloodCenterCity': instance.bloodCenterCity,
      'canCancel': instance.canCancel,
    };
