import 'package:json_annotation/json_annotation.dart';
import 'package:savelives/models/user_model.dart';

part 'doador_model.g.dart';

@JsonSerializable()
class DoadorModel extends UserModel {
  @JsonKey(name: "userBloodType")
  String? userBloodType = "";
  @JsonKey(name: "userCellphone")
  String? userCellphone = "";
  @JsonKey(name: "birth")
  DateTime? birth = DateTime.now();
  @JsonKey(name: "cpf")
  String? cpf = "";

  DoadorModel({
    this.userBloodType,
    this.userCellphone,
    this.birth,
    this.cpf,
    super.usertype
  });

  factory DoadorModel.fromJson(Map<String, dynamic> json) =>
      _$DoadorModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DoadorModelToJson(this);
}
