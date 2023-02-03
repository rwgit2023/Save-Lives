import 'package:json_annotation/json_annotation.dart';

part 'schedules_model.g.dart';

@JsonSerializable()
class SchedulesModel {
  int? id = -1;
  int? donorId = -1;
  int? bloodCenterId = -1;
  int? scheduleId = -1;
  DateTime? scheduleDate = DateTime.now();
  String? startTime = "";
  String? username = "";
  String? userCpf;
  String? userPhone = "";
  String? donorStreet = "";
  String? donorCity = "";
  String? bloodCenterCnpj = "";
  String? bloodCenterName = "";
  String? bloodCenterPhone = "";
  String? bloodCenterStreet = "";
  String? bloodCenterCity = "";
  bool? canCancel = false;

  SchedulesModel({
    this.id,
    this.donorId,
    this.bloodCenterId,
    this.scheduleId,
    this.scheduleDate,
    this.startTime,
    this.username,
    this.userCpf,
    this.userPhone,
    this.donorStreet,
    this.donorCity,
    this.bloodCenterCnpj,
    this.bloodCenterName,
    this.bloodCenterPhone,
    this.bloodCenterStreet,
    this.bloodCenterCity,
    this.canCancel,
  });

  factory SchedulesModel.fromJson(Map<String, dynamic> json) =>
      _$SchedulesModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SchedulesModelToJson(this);
}
