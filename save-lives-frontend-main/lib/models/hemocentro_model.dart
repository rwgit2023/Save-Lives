import 'package:json_annotation/json_annotation.dart';
import 'package:savelives/models/criticity_model.dart';
import 'package:savelives/models/user_model.dart';

part 'hemocentro_model.g.dart';

@JsonSerializable()
class HemocentroModel extends UserModel {
  @JsonKey(name: "phone")
  String? phone = '';
  @JsonKey(name: "legalName")
  String? legalName = '';
  @JsonKey(name: "cnpj")
  String? cnpj = '';
  @JsonKey(name: "bloodBankList")
  List<CriticityModel>? bloodBankList = [];

  HemocentroModel({
    this.phone,
    this.legalName,
    this.cnpj,
    super.usertype,
    this.bloodBankList
  });

  factory HemocentroModel.fromJson(Map<String, dynamic> json) =>
      _$HemocentroModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HemocentroModelToJson(this);
}
