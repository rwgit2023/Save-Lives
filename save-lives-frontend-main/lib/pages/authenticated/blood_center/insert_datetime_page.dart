import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/horario_model.dart';
import 'package:savelives/pages/dialogs/confirm_dialogs.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/daytime/daytime_service.dart';
import 'package:savelives/services/utils/validators.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class InsertDayTimePage extends StatefulWidget {
  InsertDayTimePage({Key? key}) : super(key: key);

  @override
  State<InsertDayTimePage> createState() => _InsertDayTimePageState();
}

class _InsertDayTimePageState extends State<InsertDayTimePage> {
  final DateRangePickerController _dateController = DateRangePickerController();
  final StreamController<List<HorarioModel>> daytimeController =
      StreamController<List<HorarioModel>>.broadcast();

  final _authRepository = Modular.get<AuthRepository>();

  final _daytimeService = DayTimeService();

  final _formKey = GlobalKey<FormState>();

  Map<String, String> interval = {};

  @override
  void initState() {
    if (!_authRepository.isLoggedIn)
      Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    daytimeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Inserir Horários"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SfDateRangePicker(
                    headerHeight: 20,
                    controller: _dateController,
                    minDate: DateTime.now(),
                    onSelectionChanged: (selection) {
                      _daytimeService.getDaytimeByDate(
                        selection.value,
                        daytimeController,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  child: Text(
                    "Inserir horários",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        inputFormatters: [Utils.getInsertTimeFormatter()],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: "Início"),
                        onSaved: (value) {
                          if (value != null && value.isNotEmpty) {
                            interval.addAll(
                              {
                                Constants.APP_KEYS.START: value.toString(),
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 2,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(hintText: "Salto [min]"),
                        onSaved: (value) {
                          if (value != null && value.isNotEmpty) {
                            interval.addAll(
                              {
                                Constants.APP_KEYS.JUMPS: value.toString(),
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        inputFormatters: [Utils.getInsertTimeFormatter()],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: "Fim"),
                        onSaved: (value) {
                          if (value != null && value.isNotEmpty) {
                            interval.addAll(
                              {
                                Constants.APP_KEYS.END: value.toString(),
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_dateController.selectedDate == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ConfirmDialogs.getConfirmDialog(
                                  context,
                                  "Atenção",
                                  "Escolha um dia",
                                  null,
                                  null,
                                );
                              },
                            );
                            return;
                          }
                          interval.addAll({
                            Constants.APP_KEYS.DAY:
                                _dateController.selectedDate.toString(),
                          });
                          _daytimeService.insertDaytime(
                              interval, daytimeController);
                        },
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Inserir",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<List<HorarioModel>>(
                  stream: daytimeController.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text(
                          "Lista de horários",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    List<HorarioModel> horarios =
                        snapshot.data as List<HorarioModel>;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemCount: horarios.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              horarios[index].startTime!,
                              textAlign: TextAlign.center,
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ConfirmDialogs
                                        .getConfirmDialog3Parameter(
                                      context,
                                      "Atenção",
                                      "Deseja deletar este horário?",
                                      horarios[index].id!,
                                      daytimeController,
                                      horarios,
                                      _daytimeService.deleteDayTimeById,
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
      ),
    );
  }
}
