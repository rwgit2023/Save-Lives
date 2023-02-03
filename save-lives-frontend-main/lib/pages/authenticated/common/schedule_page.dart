import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/horario_model.dart';
import 'package:savelives/models/schedules_model.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/pages/dialogs/alert_dialog.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/blood-center/blood_center_service.dart';
import 'package:savelives/services/daytime/daytime_service.dart';
import 'package:savelives/services/schedules/schedules_service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchedulePage();
  }
}

class _SchedulePage extends State<SchedulePage> {
  final DateRangePickerController _dateController = DateRangePickerController();
  final StreamController<List<HorarioModel>> daytimeController =
      StreamController<List<HorarioModel>>.broadcast();

  final _daytimeService = DayTimeService();
  final _scheduleService = SchedulesService();
  final _bloodCenterService = BloodCenterService();

  final _formKey = GlobalKey<FormState>();
  final _authRepository = Modular.get<AuthRepository>();

  SchedulesModel schedule = SchedulesModel();
  DateTime? _selectedDate = null;
  String? dropdownValue = null;

  @override
  void dispose() {
    _dateController.dispose();
    daytimeController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (!_authRepository.isLoggedIn)
      Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
    if (schedule.bloodCenterId != null &&
        schedule.bloodCenterId != -1 &&
        _selectedDate != null) {
      _daytimeService.getAvailableDaytimeByDate(
        _selectedDate!,
        schedule.bloodCenterId.toString(),
        daytimeController,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
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
                    onSelectionChanged: (selection) async {
                      _selectedDate = selection.value;
                      if (schedule.bloodCenterId != null &&
                          schedule.bloodCenterId != -1) {
                        await _daytimeService.getAvailableDaytimeByDate(
                          _selectedDate!,
                          schedule.bloodCenterId.toString(),
                          daytimeController,
                        );
                      }
                      setState(() {});
                    },
                  ),
                ),
                FutureBuilder(
                  future: _bloodCenterService.getAllBloodCenters(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Constants.APP_COLORS.PRIMARY_COLOR,
                        ),
                      );
                    }
                    List<UserModel> hemocentros =
                        snapshot.data as List<UserModel>;

                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: DropdownButton<String?>(
                        isExpanded: true,
                        alignment: AlignmentDirectional.center,
                        hint: const Text('Escolha um hemocentro'),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.red),
                        onChanged: (String? value) {
                          if (_selectedDate == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogs.getAlertDialog(
                                  context,
                                  "Atenção!",
                                  "Escolha um dia",
                                  null,
                                );
                              },
                            );
                            setState(() {
                              schedule.bloodCenterId = int.parse(value!);
                            });
                            return;
                          }
                          _daytimeService.getAvailableDaytimeByDate(
                            _selectedDate!,
                            value!,
                            daytimeController,
                          );
                          setState(() {
                            schedule.bloodCenterId = int.parse(value);
                          });
                        },
                        items: List.generate(
                          hemocentros.length,
                          (index) {
                            return DropdownMenuItem<String>(
                              value: hemocentros[index].userid.toString(),
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                hemocentros[index].name!,
                              ),
                              onTap: () {
                                setState(() {
                                  dropdownValue =
                                      hemocentros[index].userid.toString();
                                });
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                StreamBuilder<List<HorarioModel>>(
                  stream: daytimeController.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: const Center(
                          child: Text(
                            "Lista de horários",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                    List<HorarioModel> horarios =
                        snapshot.data as List<HorarioModel>;

                    return Container(
                      height: MediaQuery.of(context).size.height / 2,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListView.builder(
                        itemCount: horarios.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              horarios[index].startTime!,
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              setState(() {
                                schedule.scheduleId = horarios[index].id;
                              });
                            },
                            trailing: Icon(
                              Icons.check_circle,
                              color: schedule.scheduleId == horarios[index].id
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: const EdgeInsets.all(5),
                  child: TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _scheduleService.schedule(schedule);
                      }
                    },
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Agendar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
