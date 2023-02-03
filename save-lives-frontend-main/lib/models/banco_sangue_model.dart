import 'package:json_annotation/json_annotation.dart';

part 'banco_sangue_model.g.dart';

@JsonSerializable()
class BancoSangueModel {
  int? id;
  String? status;
  String? bloodType;
  int? bloodCenterId;

  BancoSangueModel({
    this.id,    
    this.bloodCenterId,
    this.status,
    this.bloodType,
  });

  factory BancoSangueModel.fromJson(Map<String, dynamic> json) =>
      _$BancoSangueModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BancoSangueModelToJson(this);

}