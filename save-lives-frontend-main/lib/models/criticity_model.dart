import 'package:json_annotation/json_annotation.dart';

part 'criticity_model.g.dart';

@JsonSerializable()
class CriticityModel {
  int? id = -1;  
  int? bloodCenterId = -1;
  String? bloodType = "";
  String? status = "";

  CriticityModel({
    this.id,
    this.bloodCenterId,
    this.bloodType,
    this.status
  });

  factory CriticityModel.fromJson(Map<String, dynamic> json) =>
      _$CriticityModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CriticityModelToJson(this);
}