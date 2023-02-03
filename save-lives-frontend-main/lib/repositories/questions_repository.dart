import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:savelives/models/questions_model.dart';
import 'package:savelives/repositories/special_converters/special_questions_converter.dart';

part 'questions_repository.g.dart';

@JsonSerializable()
class QuestionRepository extends _QuestionRepository with _$QuestionRepository{}


abstract class _QuestionRepository with Store{
  
  @observable
  @ObservableQuestionsListConverter()
  ObservableList<QuestionsModel> questionsList = ObservableList();

  @action
  void setQuestionList(List<QuestionsModel> questions) {
    questionsList = questions.asObservable();
  }

  @action
  void setAnswer(int index, bool answer){
    questionsList[index].answer = answer;
  }

}
