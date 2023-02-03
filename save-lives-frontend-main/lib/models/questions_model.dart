import 'package:json_annotation/json_annotation.dart';

part 'questions_model.g.dart';

@JsonSerializable()
class QuestionsModel  {
  @JsonKey(name: "id")
  int? id = -1;
  @JsonKey(name: "question")
  String? question = "";
  @JsonKey(name: "expecetdAnswer")
  bool? expecetdAnswer = false;
  @JsonKey(name: "answerType")
  int? answerType = 0;
  bool? answer;

  QuestionsModel(
      {this.id, this.question, this.expecetdAnswer, this.answerType});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsModelToJson(this);
}
