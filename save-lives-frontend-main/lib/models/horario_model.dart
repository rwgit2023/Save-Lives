import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'horario_model.g.dart';

@JsonSerializable()
class HorarioModel {
  
  int? id = -1;
  int? bloodCenterId = -1;
  DateTime? day = DateTime.now();
  String? startTime = TimeOfDay.now().toString();
  String? endTime = TimeOfDay.now().toString();

  String? cpf = "";

  HorarioModel({
    this.id,
    this.bloodCenterId,
    this.day,
    this.startTime,
    this.endTime
  });

  factory HorarioModel.fromJson(Map<String, dynamic> json) =>
      _$HorarioModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HorarioModelToJson(this);
}
