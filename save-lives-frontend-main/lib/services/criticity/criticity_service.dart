import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/criticity_model.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/rest/rest_service.dart';

class CriticityService {
  final _restService = RestService();
  final _authRepository = Modular.get<AuthRepository>();

  Future<List<CriticityModel>> getCriticityListByBloodCenterId(
    int bloodCenterId,
    StreamController<List<CriticityModel>> controller,
  ) async {
    String endpoint =
        Constants.HTTP_ENDPOINTS.GET_BLOOD_CRITICITY_BY_BLOOD_CENTER_ID +
            bloodCenterId.toString();

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          "Bearer " + _authRepository.token.toString()
    };

    Map<String, dynamic> data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) return [];

    List<dynamic> list = response as List<dynamic>;
    List<CriticityModel> criticities = [];

    list.forEach((element) {
      criticities.add(CriticityModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    controller.add(criticities);

    return criticities;
  }

  Future<CriticityModel?> addCriticity(CriticityModel criticity) async {
    //
    if (await checkCriticityExists(criticity)) return null;

    String endpoint =
        Constants.HTTP_ENDPOINTS.ADD_BLOOD_CRITICITY_BY_BLOOD_CENTER_ID;

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          "Bearer " + _authRepository.token.toString()
    };

    criticity.bloodCenterId =
        _authRepository.userInformation![Constants.APP_KEYS.USER_ID];

    dynamic data = criticity;

    var response = await _restService.post(endpoint, data, headers);

    if (response == null) return null;

    if (response != null) criticity.id = response;

    return criticity;
  }

  Future<bool> deleteCriticity(
    CriticityModel criticity,
    StreamController<List<CriticityModel>> controller,
    List<CriticityModel> list,
  ) async {
    String endpoint = Constants.HTTP_ENDPOINTS.DELETE_BLOOD_CRITICITY_BY_ID +
        criticity.id.toString();

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          "Bearer " + _authRepository.token.toString()
    };

    Map<String, dynamic> data = {};

    var response = await _restService.delete(endpoint, data, headers);

    if (response == null) return false;

    if (response) {
      CriticityModel critic = list.firstWhere((element) => element.bloodType == criticity.bloodType);
      list.removeWhere((element) => element.bloodType == criticity.bloodType);
      controller.add(list);
    }

    return true;
  }

  Future<bool> checkCriticityExists(CriticityModel criticity) async {
    String endpoint = Constants
            .HTTP_ENDPOINTS.GET_BLOOD_CRITICITY_BY_BLOOD_CENTER_ID +
        _authRepository.userInformation![Constants.APP_KEYS.USER_ID].toString();

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          "Bearer " + _authRepository.token.toString()
    };

    Map<String, dynamic> data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) return false;

    List<dynamic> list = response as List<dynamic>;

    if (list.isEmpty) return false;

    List<CriticityModel> criticities = [];

    list.forEach((element) {
      criticities.add(CriticityModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    if (criticities
        .where((element) => element.bloodType == criticity.bloodType)
        .isEmpty) return false;

    return true;
  }
}
