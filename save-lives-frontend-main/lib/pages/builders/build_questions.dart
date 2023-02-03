import 'package:flutter/material.dart';
import 'package:savelives/models/questions_model.dart';

class BuildQuestions {
  
  static List<Step> buildQuestions(List<QuestionsModel> list)  {
    if (list.isEmpty) {
      return [
        const Step(
          title: Text('Não há perguntas'),
          content: Text(''),
        )
      ];
    }

    List<Step> questionList = [];

    for (var element in list) {
      questionList.add(
        Step(          
          title: Text(element.question!),
          content: const Text(''),
        ),
      );
    }

    return questionList;
  }
}
