// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userid: json['userid'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      psw: json['psw'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      zip: json['zip'] as String?,
      usertype: json['usertype'] as String?,
      number: json['number'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
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
    };
