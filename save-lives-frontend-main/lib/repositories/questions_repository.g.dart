// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionRepository _$QuestionRepositoryFromJson(Map<String, dynamic> json) =>
    QuestionRepository()
      ..questionsList = const ObservableQuestionsListConverter()
          .fromJson(json['questionsList'] as Iterable<Map<String, dynamic>>);

Map<String, dynamic> _$QuestionRepositoryToJson(QuestionRepository instance) =>
    <String, dynamic>{
      'questionsList': const ObservableQuestionsListConverter()
          .toJson(instance.questionsList),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuestionRepository on _QuestionRepository, Store {
  late final _$questionsListAtom =
      Atom(name: '_QuestionRepository.questionsList', context: context);

  @override
  ObservableList<QuestionsModel> get questionsList {
    _$questionsListAtom.reportRead();
    return super.questionsList;
  }

  @override
  set questionsList(ObservableList<QuestionsModel> value) {
    _$questionsListAtom.reportWrite(value, super.questionsList, () {
      super.questionsList = value;
    });
  }

  late final _$_QuestionRepositoryActionController =
      ActionController(name: '_QuestionRepository', context: context);

  @override
  void setQuestionList(List<QuestionsModel> questions) {
    final _$actionInfo = _$_QuestionRepositoryActionController.startAction(
        name: '_QuestionRepository.setQuestionList');
    try {
      return super.setQuestionList(questions);
    } finally {
      _$_QuestionRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswer(int index, bool answer) {
    final _$actionInfo = _$_QuestionRepositoryActionController.startAction(
        name: '_QuestionRepository.setAnswer');
    try {
      return super.setAnswer(index, answer);
    } finally {
      _$_QuestionRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
questionsList: ${questionsList}
    ''';
  }
}
