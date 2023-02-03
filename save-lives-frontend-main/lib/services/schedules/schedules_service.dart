import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/schedules_model.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/rest/rest_service.dart';
import 'package:savelives/services/utils/validators.dart';

class SchedulesService {
  final _authRepository = Modular.get<AuthRepository>();
  final _restService = RestService();

  Future<List<SchedulesModel>> getSchedulesByCriteria(String getType) async {
    //
    //String endpoint = "https://savelives-backend.herokuapp.com${Constants.HTTP_ENDPOINTS.LOGIN}";
    String endpoint = Constants.HTTP_ENDPOINTS.GET_SCHEDULES_BY_CRITERIA;

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {
      Constants.APP_KEYS.USER_ID: _authRepository
          .userInformation![Constants.APP_KEYS.USER_ID]
          .toString(),
      Constants.APP_KEYS.USER_TYPE: _authRepository
          .userInformation![Constants.APP_KEYS.USER_TYPE]
          .toString(),
      Constants.APP_KEYS.SCHEDULE_TYPE: getType
    };

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      return [];
    }

    List<dynamic> list = response as List<dynamic>;
    List<SchedulesModel> schedules = [];

    list.forEach((element) {
      SchedulesModel sc =
          SchedulesModel.fromJson(jsonDecode(jsonEncode(element)));
      sc.canCancel = checkCanCancel(sc);
      schedules.add(sc);
    });

    return schedules;
  }

  Future<bool> schedule(SchedulesModel schedule) async {
    //
    //String endpoint = "https://savelives-backend.herokuapp.com${Constants.HTTP_ENDPOINTS.LOGIN}";
    String endpoint = Constants.HTTP_ENDPOINTS.SCHEDULE;

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    schedule.donorId =
        _authRepository.userInformation![Constants.APP_KEYS.USER_ID];

    dynamic data = schedule;

    var response = await _restService.post(endpoint, data, headers);

    if (response == null) {
      return false;
    }

    Modular.to.pushNamed("/pending-schedule");

    return true;
  }

  bool checkCanCancel(SchedulesModel schedule) {
    bool isScheduleDateAfterToday = DateUtils.dateOnly(schedule.scheduleDate!)
        .isAfter(DateUtils.dateOnly(DateTime.now()));
    bool isScheduleDateEqualsToday =
        DateUtils.dateOnly(schedule.scheduleDate!) ==
            DateUtils.dateOnly(DateTime.now());

    if (isScheduleDateAfterToday) {
      return true;
    }
    TimeOfDay time = Utils.getTimeOfDayFromString(schedule.startTime!);

    if (isScheduleDateEqualsToday &&
        (time.hour + (time.minute / 60)) >
            (TimeOfDay.now().hour + (TimeOfDay.now().minute / 60))) {
      return true;
    }

    return false;
  }

  Future<bool> cancelSchedule(SchedulesModel schedule) async {
    //
    //String endpoint = "https://savelives-backend.herokuapp.com${Constants.HTTP_ENDPOINTS.LOGIN}";
    String endpoint = Constants.HTTP_ENDPOINTS.DELETE_SCHEDULES_BY_ID +
        schedule.id.toString();

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {};

    var response = await _restService.delete(endpoint, data, headers);

    if (response == null) {
      return false;
    }

    Modular.to.pushNamed("/pending-schedule");

    return true;
  }
}
