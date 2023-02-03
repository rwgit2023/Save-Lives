import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:savelives/constants/constants.dart';

import 'package:savelives/models/schedules_model.dart';
import 'package:savelives/repositories/auth_repository.dart';

class ScheduleDetailPage extends StatefulWidget {
  SchedulesModel? schedulesModel;

  ScheduleDetailPage({Key? key, this.schedulesModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScheduleDetailPage();
  }
}

class _ScheduleDetailPage extends State<ScheduleDetailPage> {
  final _authRepository = Modular.get<AuthRepository>();

  @override
  void initState() {
    super.initState();
    if (!_authRepository.isLoggedIn)
      Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
    if (widget.schedulesModel == null) Modular.to.pushNamed("/history");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.schedulesModel!.username!),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                readOnly: true,
                initialValue: widget.schedulesModel!.username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                readOnly: true,
                initialValue: widget.schedulesModel!.bloodCenterName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                readOnly: true,
                initialValue: widget.schedulesModel!.userCpf,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                readOnly: true,
                initialValue: _authRepository
                            .userInformation![Constants.APP_KEYS.USER_TYPE] ==
                        Constants.ROLES.BLOOD_CENTER
                    ? widget.schedulesModel!.donorCity
                    : widget.schedulesModel!.bloodCenterCity,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              child: _authRepository
                          .userInformation![Constants.APP_KEYS.USER_TYPE] !=
                      Constants.ROLES.BLOOD_CENTER
                  ? TextFormField(
                      readOnly: true,
                      initialValue: widget.schedulesModel!.bloodCenterStreet,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                  : TextFormField(
                      readOnly: true,
                      initialValue: widget.schedulesModel!.startTime,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                readOnly: true,
                initialValue: DateFormat("dd/MM/yyyy")
                    .format(widget.schedulesModel!.scheduleDate!),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
