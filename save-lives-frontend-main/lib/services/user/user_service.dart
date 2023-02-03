import 'dart:convert';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/doador_model.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/auth/auth_service.dart';
import 'package:savelives/services/rest/rest_service.dart';

class UserService {
  //
  final _restService = RestService();
  final _authRepository = Modular.get<AuthRepository>();
  final _authService = AuthService();
  //
  Future<bool> saveUser(UserModel user) async {
    String endpoint = "";

    if (user.usertype == Constants.ROLES.DONOR) {
      endpoint = Constants.HTTP_ENDPOINTS.SIGN_UP_DONOR;
    } else {
      endpoint = Constants.HTTP_ENDPOINTS.SIGN_UP_BLOODCENTER;
    }
    Map<String, String>? headers = {
      HttpHeaders.contentTypeHeader: "application/json"
    };
    UserModel data;

    data = user;

    var response = await _restService.post(endpoint, data, headers);

    if (response == null) {
      return false;
    }

    if (int.tryParse(response.toString()) != null)
      Modular.to.pushNamed('/login');

    return false;
  }

  Future<bool> updateUser(UserModel user) async {
    String endpoint = "";

    user.usertype =
        _authRepository.userInformation![Constants.APP_KEYS.USER_TYPE];

    if (user.usertype == Constants.ROLES.DONOR) {
      endpoint = Constants.HTTP_ENDPOINTS.UPDATE_DONOR;
    } else {
      endpoint = Constants.HTTP_ENDPOINTS.UPDATE_BLOODCENTER;
    }
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };
    dynamic data;

    data = user;

    var response = await _restService.put(endpoint, data, headers);

    if (response == null) {
      return false;
    }

    if (response as bool) Modular.to.pushNamed('/profile-page');

    return false;
  }

  Future<Map<String, UserModel>?> getUserProfile(
      String userType, String userId) async {
    String endpoint = "";

    if (userType == Constants.ROLES.BLOOD_CENTER) {
      endpoint = Constants.HTTP_ENDPOINTS.GET_BLOOD_CENTER_BY_ID + userId;
    } else {
      endpoint = Constants.HTTP_ENDPOINTS.GET_DONOR_BY_ID + userId;
    }

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {};

    var response = await _restService.get(endpoint, data, headers);

    if (response == null) {
      return null;
    }

    UserModel user;

    if (userType == Constants.ROLES.BLOOD_CENTER) {
      user = HemocentroModel.fromJson(jsonDecode(jsonEncode(response)));
    } else {
      user = DoadorModel.fromJson(jsonDecode(jsonEncode(response)));
    }

    return {userType: user};
  }

  Future<void> deleteAccount(int userId) async {
    String endpoint =
        Constants.HTTP_ENDPOINTS.DELETE_USER_BY_ID + userId.toString();

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + _authRepository.token!
    };

    Map<String, dynamic>? data = {};

    var response = await _restService.delete(endpoint, data, headers);

    if (response == null) {
      return null;
    }

    if (response) {
      _authService.logout();
      Modular.to.pushNamedAndRemoveUntil("/login", (p0) => false);
      return;
    }

    return;
  }
}
