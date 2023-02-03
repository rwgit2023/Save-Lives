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
            "Você está inapto temporariamente. Por favor, entre em contato com o hemocentro mais próximo.",
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
                "Parabéns",
                "Você pode comparecer ao hemocentro mais próximo e agendar sua doação\n\n Condições básicas para doar:\n\n -Sentir-se bem, com saúde;\n\n -Apresentar documento com foto, emitido por órgão oficial e válido em todo o território nacional;\n\n - Ter peso acima de 50kg;\n\n - Ter entre 16 e 69 anos de idade, desde que a primeira doação tenha acontecido até os 60 anos. (Menores de 18 anos necessitam de autorização por escrito do responsável legal).\n\n\n Importante no dia da doação:\n\n -Nunca doar sangue em jejum;\n\n -Fazer um repouso mínimo de 6 horas na noite anterior à doação;\n\n -Evitar fumar por pelo menos duas horas antes e depois da doação;\n\n -Evitar ingerir alimentos gordurosos.\n\n -Pessoas que exercem profissões como: pilotar avião ou helicóptero, conduzir ônibus ou caminhões de grande porte, sobem em andaimes e praticam paraquedismo ou mergulho, devem interromper estas atividades por 12 horas antes da doação.\n\n\n Quem não pode doar?\n\n -Quem teve diagnóstico de hepatite após os 10 anos de idade;\n\n -Mulheres grávidas ou que estejam amamentando;\n\n -Pessoas que estão expostas a doenças transmissíveis pelo sangue como AIDS, hepatite, sífilis e Doença de Chagas;\n\n -Usuários de drogas;\n\n -Aqueles que tiveram relacionamento sexual com parceiro desconhecido ou eventual, sem uso de preservativos.",
                null,
          );
        },
      );
    }
  }
}
