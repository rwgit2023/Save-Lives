import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:savelives/models/questions_model.dart';

class ObservableQuestionsListConverter extends JsonConverter<ObservableList<QuestionsModel>,
    Iterable<Map<String, dynamic>>> {
  const ObservableQuestionsListConverter();

  @override
  ObservableList<QuestionsModel> fromJson(Iterable<Map<String, dynamic>> json) =>
      ObservableList.of(json.map(QuestionsModel.fromJson));

  @override
  Iterable<Map<String, dynamic>> toJson(ObservableList<QuestionsModel> object) =>
      object.map((element) => element.toJson());
}
