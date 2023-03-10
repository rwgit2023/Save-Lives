import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/questions_model.dart';
import 'package:savelives/pages/builders/snackbars.dart';
import 'package:savelives/pages/dialogs/alert_dialog.dart';
import 'package:savelives/repositories/questions_repository.dart';
import 'package:savelives/services/rest/rest_service.dart';

class QuestionsService {
  final _questionRepository = Modular.get<QuestionRepository>();
  final _restService = RestService();

  //
  Future<List<QuestionsModel>> getAllQuestions() async {
    String endpoint = Constants.HTTP_ENDPOINTS.GET_ALL_QUESTIONS;
    Map<String, String> headers = {};
    Map<String, dynamic> data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      return [];
    }

    List<dynamic> list = response as List<dynamic>;
    List<QuestionsModel> questions = [];

    list.forEach((element) {
      questions.add(QuestionsModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    _questionRepository.setQuestionList(questions);

    return questions;
  }

  void answerQuestion(int index, bool answer) {
    _questionRepository.setAnswer(index, answer);
  }

  void compareAnswers(BuildContext context) {
    bool result = true;

    List<QuestionsModel> response = _questionRepository.questionsList
        .where((element) => element.answer != null)
        .toList();

    if (response.length < _questionRepository.questionsList.length) {
      return SnackBars.showSnackBar(context, 'Responda todas as perguntas');
    }

    for (int i = 0; i < _questionRepository.questionsList.length; i++) {
      if (i == 5) {
        if (_questionRepository.questionsList[i].answer == false) {
          result = false;
          break;
        }
        continue;        
      } 
      
      if (_questionRepository.questionsList[i].answer != false) {
        result = false;
        break;
      }
    }

    if (!result) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialogs.badDialog(
            context,
            "Opa!",
            "Voc?? est?? inapto temporariamente. Por favor, entre em contato com o hemocentro mais pr??ximo.",
            null,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) { 
          content: SingleChildScrollView(child: new Column(
            
          ),);         
          return AlertDialogs.goodDialog(
                context,
                "Parab??ns",
                "Voc?? pode comparecer ao hemocentro mais pr??ximo e agendar sua doa????o\n\n Condi????es b??sicas para doar:\n\n -Sentir-se bem, com sa??de;\n\n -Apresentar documento com foto, emitido por ??rg??o oficial e v??lido em todo o territ??rio nacional;\n\n - Ter peso acima de 50kg;\n\n - Ter entre 16 e 69 anos de idade, desde que a primeira doa????o tenha acontecido at?? os 60 anos. (Menores de 18 anos necessitam de autoriza????o por escrito do respons??vel legal).\n\n\n Importante no dia da doa????o:\n\n -Nunca doar sangue em jejum;\n\n -Fazer um repouso m??nimo de 6 horas na noite anterior ?? doa????o;\n\n -Evitar fumar por pelo menos duas horas antes e depois da doa????o;\n\n -Evitar ingerir alimentos gordurosos.\n\n -Pessoas que exercem profiss??es como: pilotar avi??o ou helic??ptero, conduzir ??nibus ou caminh??es de grande porte, sobem em andaimes e praticam paraquedismo ou mergulho, devem interromper estas atividades por 12 horas antes da doa????o.\n\n\n Quem n??o pode doar?\n\n -Quem teve diagn??stico de hepatite ap??s os 10 anos de idade;\n\n -Mulheres gr??vidas ou que estejam amamentando;\n\n -Pessoas que est??o expostas a doen??as transmiss??veis pelo sangue como AIDS, hepatite, s??filis e Doen??a de Chagas;\n\n -Usu??rios de drogas;\n\n -Aqueles que tiveram relacionamento sexual com parceiro desconhecido ou eventual, sem uso de preservativos.",
                null,
          );
        },
      );
    }
  }
}
