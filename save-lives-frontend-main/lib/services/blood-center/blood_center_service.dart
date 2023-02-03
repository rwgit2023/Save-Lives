import 'dart:async';
import 'dart:convert';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/services/rest/rest_service.dart';

class BloodCenterService {
  final _restService = RestService();

  Future<List<UserModel>> getAllBloodCenters() async {
    String? endpoint = Constants.HTTP_ENDPOINTS.GET_ALL_BLOOD_CENTER;
    Map<String, String> headers = {};
    Map<String, String> data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      return [];
    }

    List<dynamic> list = response as List<dynamic>;
    List<UserModel> bloodCenters = [];

    list.forEach((element) {
      bloodCenters.add(UserModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    return bloodCenters;
  }

  Future<List<UserModel>> getAllBloodCenterWithCriticity() async {
    String? endpoint =
        Constants.HTTP_ENDPOINTS.READ_ALL_BLOODCENTER_WITH_CRITICITY;
    Map<String, String> headers = {};
    Map<String, String> data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {  
      return [];  
    }

    List<dynamic> list = response as List<dynamic>;
    List<HemocentroModel> bloodCenters = [];

    list.forEach((element) {
      bloodCenters.add(HemocentroModel.fromJson(jsonDecode(jsonEncode(element))));
    });

    return bloodCenters;
  }

  Future<HemocentroModel?> getBloodCenterById(int id) async {
    String? endpoint =
        Constants.HTTP_ENDPOINTS.GET_BLOOD_CENTER_BY_ID + id.toString();
    Map<String, dynamic>? headers = {};
    Map<String, dynamic>? data = {};
  
    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      return null;
    }

    try {
      HemocentroModel bloodCenter =
          HemocentroModel.fromJson(jsonDecode(jsonEncode(response)));

      return bloodCenter;
    } catch (e) {
      print(e);
      return null;
    }
  }

}
