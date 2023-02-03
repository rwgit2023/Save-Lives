import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "userid")
  int? userid = -1;
  @JsonKey(name: "name")
  String? name = "";
  @JsonKey(name: "email")
  String? email = "";
  @JsonKey(name: "psw")
  String? psw = "";
  @JsonKey(name: "city")
  String? city = "";
  @JsonKey(name: "state")
  String? state = "";
  @JsonKey(name: "street")
  String? street = "";
  @JsonKey(name: "neighbourhood")
  String? neighbourhood = "";
  @JsonKey(name: "zip")
  String? zip = "";
  @JsonKey(name: "usertype")
  String? usertype = "";
  /*
  @JsonKey(name: "foto")
  Uint8List? photo;
  */
  @JsonKey(name: "number")
  String? number;
  @JsonKey(name: "latitude")
  double? latitude = 0;
  @JsonKey(name: "longitude")
  double? longitude = 0;
  @JsonKey(name: "token")
  String? token = "";

  UserModel(
      {this.userid,
      this.name,
      this.email,
      this.psw,
      this.city,
      this.state,
      this.street,
      this.neighbourhood,
      this.zip,
      this.usertype,
      this.number,
      this.latitude,
      this.longitude,
      this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
