import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/criticity_model.dart';
import 'package:savelives/pages/dialogs/confirm_dialogs.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/criticity/criticity_service.dart';

class InsertBloodCriticityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InsertBloodCriticityPage();
  }
}

class _InsertBloodCriticityPage extends State<InsertBloodCriticityPage> {
  CriticityModel _criticityModel = CriticityModel();

  final _criticityService = CriticityService();

  final _authRepository = Modular.get<AuthRepository>();

  List<CriticityModel> list = [];

  final StreamController<List<CriticityModel>> criticitiesController =
      StreamController<List<CriticityModel>>.broadcast();

  @override
  void initState() {
    super.initState();
    _criticityModel.bloodType = Constants.BLOOD_CENTER_CONSTANTS.BLOOD_TYPES[0];
    _criticityModel.status = Constants.BLOOD_CENTER_CONSTANTS.CRITICITY[0];

    _criticityService.getCriticityListByBloodCenterId(
      _authRepository.userInformation![Constants.APP_KEYS.USER_ID],
      criticitiesController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criticidade'),
      ),
      body: SingleChildScrollView(
        physics: new ScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                child: Center(
                  child: Image.asset(
                    'assets/images/blood_drop.png',
                    height: 120,
                    width: 100,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String?>(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      hint: const Text('Tipo sanguíneo'),
                      value: _criticityModel.bloodType,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.red),
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null) _criticityModel.bloodType = value;
                        });
                      },
                      items: List.generate(
                        Constants.BLOOD_CENTER_CONSTANTS.BLOOD_TYPES.length,
                        (index) {
                          return DropdownMenuItem<String>(
                            value: Constants
                                .BLOOD_CENTER_CONSTANTS.BLOOD_TYPES[index],
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              Constants
                                  .BLOOD_CENTER_CONSTANTS.BLOOD_TYPES[index],
                            ),
                            onTap: () {
                              setState(() {
                                _criticityModel.bloodType = Constants
                                    .BLOOD_CENTER_CONSTANTS.BLOOD_TYPES[index];
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String?>(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      hint: const Text('Criticidade'),
                      value: _criticityModel.status,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.red),
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null) _criticityModel.status = value;
                        });
                      },
                      items: List.generate(
                        Constants.BLOOD_CENTER_CONSTANTS.CRITICITY.length,
                        (index) {
                          return DropdownMenuItem<String>(
                            value: Constants
                                .BLOOD_CENTER_CONSTANTS.CRITICITY[index],
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              Constants.BLOOD_CENTER_CONSTANTS.CRITICITY[index],
                            ),
                            onTap: () {
                              setState(() {
                                _criticityModel.status = Constants
                                    .BLOOD_CENTER_CONSTANTS.CRITICITY[index];
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                margin: const EdgeInsets.all(10),
                child: TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () async {
                    var response =
                        await _criticityService.addCriticity(_criticityModel);
                    if (response == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Esta criticidade já foi cadastrada'),
                        ),
                      );
                      return;
                    }
                    _criticityService.getCriticityListByBloodCenterId(
                      _authRepository
                          .userInformation![Constants.APP_KEYS.USER_ID],
                      criticitiesController,
                    );
                  },
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Salvar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: criticitiesController.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Constants.APP_COLORS.PRIMARY_COLOR,
                      ),
                    );
                  }
                  List<CriticityModel> criticities =
                      snapshot.data as List<CriticityModel>;

                  if (criticities.isEmpty) {
                    return const SizedBox(
                      height: 150,
                      child: Center(
                        child: Text("Sem criticidades"),
                      ),
                    );
                  }

                  return Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    margin: EdgeInsets.all(20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: criticities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.bloodtype,
                            color: Constants.BLOOD_CENTER_CONSTANTS
                                .CRITICITY_COLORS[criticities[index].status],
                          ),
                          title: Text(criticities[index].bloodType.toString()),
                          subtitle: Text(
                            criticities[index].status.toString(),
                            style: TextStyle(
                              color: Constants.BLOOD_CENTER_CONSTANTS
                                  .CRITICITY_COLORS[criticities[index].status],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ConfirmDialogs
                                      .getConfirmDialog3Parameter(
                                    context,
                                    "Atenção",
                                    "Deseja deletar esta criticidade?",
                                    criticities[index],
                                    criticitiesController,
                                    criticities,
                                    _criticityService.deleteCriticity,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
