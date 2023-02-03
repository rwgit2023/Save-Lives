// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) =>
    QuestionsModel(
      id: json['id'] as int?,
      question: json['question'] as String?,
      expecetdAnswer: json['expecetdAnswer'] as bool?,
      answerType: json['answerType'] as int?,
    )..answer = json['answer'] as bool?;

Map<String, dynamic> _$QuestionsModelToJson(QuestionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'expecetdAnswer': instance.expecetdAnswer,
      'answerType': instance.answerType,
      'answer': instance.answer,
    };
