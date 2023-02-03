import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/pages/builders/build_questions.dart';
import 'package:savelives/repositories/questions_repository.dart';
import 'package:savelives/services/questions/questions_service.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StatefulQuestions();
  }
}

class _StatefulQuestions extends State<QuestionsPage> {
  int _index = 0;

  final questionsRepository = Modular.get<QuestionRepository>();
  final questionsService = QuestionsService();

  void moveForward() {
    setState(() {
      if (_index + 1 < questionsRepository.questionsList.length) {
        _index += 1;
      }
    });
  }

  @override
  void initState() {
    questionsService.getAllQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questionário teste"),
      ),
      body: Observer(
        builder: (context) {
          if (questionsRepository.questionsList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  currentStep: _index,
                  onStepContinue: () {
                    questionsService.answerQuestion(_index, true);
                    moveForward();
                  },
                  onStepCancel: () {
                    questionsService.answerQuestion(_index, false);
                    moveForward();
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: details.onStepContinue,
                          style: ButtonStyle(
                            backgroundColor: questionsRepository
                                        .questionsList[details.stepIndex]
                                        .answer ==
                                    true
                                ? MaterialStateProperty.all<Color>(Colors.red)
                                : MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                          ),
                          child: Text(
                            'Sim',
                            style: TextStyle(
                                color: questionsRepository
                                            .questionsList[details.stepIndex]
                                            .answer ==
                                        true
                                    ? Colors.white
                                    : Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: details.onStepCancel,
                          style: ButtonStyle(
                            backgroundColor: questionsRepository
                                        .questionsList[details.stepIndex]
                                        .answer ==
                                    false
                                ? MaterialStateProperty.all<Color>(Colors.red)
                                : MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                          ),
                          child: Text(
                            'Não',
                            style: TextStyle(
                                color: questionsRepository
                                            .questionsList[details.stepIndex]
                                            .answer ==
                                        false
                                    ? Colors.white
                                    : Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                  steps: BuildQuestions.buildQuestions(
                    questionsRepository.questionsList.toList(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(10),
                  child: TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      questionsService.compareAnswers(context);
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Verificar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
