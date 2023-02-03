import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/schedules_model.dart';

import 'package:intl/intl.dart';
import 'package:savelives/pages/dialogs/confirm_dialogs.dart';

import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/schedules/schedules_service.dart';

class PendingSchedulesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PendingSchedulePage();
  }
}

class _PendingSchedulePage extends State<PendingSchedulesPage> {
  final _schedulesService = SchedulesService();
  final _authRepository = Modular.get<AuthRepository>();

  @override
  void initState() {
    super.initState();
    if (!_authRepository.isLoggedIn)
      Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: (){
            Modular.to.pushNamed('/');
          },)
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder(
          future: _schedulesService
              .getSchedulesByCriteria(Constants.APP_KEYS.PENDING),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Constants.APP_COLORS.PRIMARY_COLOR,
                ),
              );
            }

            List<SchedulesModel> schedules =
                snapshot.data as List<SchedulesModel>;

            return ListView.builder(
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Modular.to.pushNamed("/schedule-detail",
                        arguments: schedules[index]);
                  },
                  leading: const Icon(Icons.schedule),
                  title: Text(
                    _authRepository.userInformation![
                                Constants.APP_KEYS.USER_TYPE] ==
                            Constants.ROLES.BLOOD_CENTER
                        ? schedules[index].username.toString()
                        : schedules[index].bloodCenterName.toString(),
                  ),
                  subtitle: Text(
                    DateFormat("dd/MM/yyyy")
                            .format(schedules[index].scheduleDate!) +
                        " " +
                        schedules[index].startTime!,
                  ),
                  trailing: schedules[index].canCancel!
                      ? IconButton(
                          icon: Icon(
                            Icons.block,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ConfirmDialogs.getConfirmDialog(
                                  context,
                                  "Atenção",
                                  'Tem certeza que deseja cancelar este agendamento?',
                                  schedules[index],
                                  _schedulesService.cancelSchedule,
                                );
                              },
                            );
                          },
                        )
                      : const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
