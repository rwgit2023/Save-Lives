// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doador_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoadorModel _$DoadorModelFromJson(Map<String, dynamic> json) => DoadorModel(
      userBloodType: json['userBloodType'] as String?,
      userCellphone: json['userCellphone'] as String?,
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
      cpf: json['cpf'] as String?,
      usertype: json['usertype'] as String?,
    )
      ..userid = json['userid'] as int?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..psw = json['psw'] as String?
      ..city = json['city'] as String?
      ..state = json['state'] as String?
      ..street = json['street'] as String?
      ..neighbourhood = json['neighbourhood'] as String?
      ..zip = json['zip'] as String?
      ..number = json['number'] as String?
      ..latitude = (json['latitude'] as num?)?.toDouble()
      ..longitude = (json['longitude'] as num?)?.toDouble()
      ..token = json['token'] as String?;

Map<String, dynamic> _$DoadorModelToJson(DoadorModel instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'name': instance.name,
      'email': instance.email,
      'psw': instance.psw,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'neighbourhood': instance.neighbourhood,
      'zip': instance.zip,
      'usertype': instance.usertype,
      'number': instance.number,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'token': instance.token,
      'userBloodType': instance.userBloodType,
      'userCellphone': instance.userCellphone,
      'birth': instance.birth?.toIso8601String(),
      'cpf': instance.cpf,
    };
