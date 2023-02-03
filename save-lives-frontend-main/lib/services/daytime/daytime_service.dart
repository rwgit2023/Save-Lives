import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/horario_model.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/rest/rest_service.dart';

class DayTimeService {
  final _restService = RestService();

  final _authRepository = Modular.get<AuthRepository>();

  Future<List<HorarioModel>> insertDaytime(Map<String, String> interval,
      StreamController<List<HorarioModel>> controller) async {
    interval[Constants.APP_KEYS.DAY] =
        interval[Constants.APP_KEYS.DAY]!.split(" ")[0];

    interval.addAll({
      Constants.APP_KEYS.HEMOCENTRO_ID: _authRepository
          .userInformation![Constants.APP_KEYS.USER_ID]
          .toString()
    });

    String endpoint = Constants.HTTP_ENDPOINTS.CREATE_BY_INTERVAL;

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic> data = interval;

    var response = await _restService.post(endpoint, jsonEncode(data), headers);

    if (response == null) {
      return [];
    }

    List<dynamic> daytimeList = response as List<dynamic>;
    List<HorarioModel> horarios = [];

    daytimeList.forEach((element) {
      horarios.add(HorarioModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    controller.add(horarios);

    return [];
  }

  Future<List<HorarioModel>> getDaytimeByDate(
      DateTime date, StreamController<List<HorarioModel>> controller) async {
    //String endpoint = "https://savelives-backend.herokuapp.com${Constants.HTTP_ENDPOINTS.LOGIN}";
    String endpoint = Constants.HTTP_ENDPOINTS.GET_SCHEDULES_BY_DATE;
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {
      Constants.APP_KEYS.DAY: date.toString().split(" ")[0],
      Constants.APP_KEYS.USER_ID: _authRepository
          .userInformation![Constants.APP_KEYS.USER_ID]
          .toString()
    };

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      controller.add([
      ]);
      return [];
    }

    List<dynamic> daytimeList = response as List<dynamic>;
    List<HorarioModel> horarios = [];

    daytimeList.forEach((element) {
      horarios.add(HorarioModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    controller.add(horarios);

    return [];
  }

  Future<List<HorarioModel>> getAvailableDaytimeByDate(
    DateTime date,
    String bloodCenterId,
    StreamController<List<HorarioModel>> controller,
  ) async {
    //
    //String endpoint = "https://savelives-backend.herokuapp.com${Constants.HTTP_ENDPOINTS.LOGIN}";
    String endpoint =
        "${Constants.HTTP_ENDPOINTS.GET_AVAILABLE_DAYTIME_BY_DATE}${date.toString().split(" ")[0]}/$bloodCenterId";

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      controller.add([
      ]);
      return [];
    }

    List<dynamic> daytimeList = response as List<dynamic>;
    List<HorarioModel> horarios = [];

    daytimeList.forEach((element) {
      horarios.add(HorarioModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    controller.add(horarios);

    return [];
  }

  Future<bool> deleteDayTimeById(
    int id,
    StreamController<List<HorarioModel>> controller,
    List<HorarioModel> list,
  ) async {
    //String endpoint = "https://savelives-backend.herokuapp.com${Constants.HTTP_ENDPOINTS.LOGIN}";
    String endpoint =
        Constants.HTTP_ENDPOINTS.DELETE_DAYTIME_BY_ID + id.toString();

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {};

    var response = await _restService.delete(endpoint, data, headers);

    if (response == null) {
      return false;
    }

    if (response) {
      HorarioModel horario = list.firstWhere((element) => element.id == id);
      list.removeWhere((element) => element.id == id);
      controller.add(list);
    }

    return true;
  }
}
