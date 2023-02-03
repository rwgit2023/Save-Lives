import 'dart:convert';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/rest/rest_service.dart';
import 'package:savelives/services/shared_preferences/shared_preferences.dart';

class AuthService {
  final _restService = RestService();
  final _authRepository = Modular.get<AuthRepository>();

  Future<bool> login(String email, String psw) async {
    if (email.isEmpty || psw.isEmpty) return false;
    
    String endpoint = Constants.HTTP_ENDPOINTS.LOGIN;
    Map<String, String> headers = {};
    Map<String, dynamic> data = {};

    String auth = "email=$email;password=$psw";

    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(auth);

    headers.addAll({
      HttpHeaders.authorizationHeader: "Basic $encoded",
    });    
    
    var response = await _restService.post(endpoint, data, headers);

    if (response == null) return false;

    UserModel user = UserModel.fromJson(jsonDecode(jsonEncode(response)));

    _authRepository.setToken(user.token);
    _authRepository.setUsername(user.name);
    _authRepository.setIsLoggedIn(true);
    _authRepository.setUserInformation({
      Constants.APP_KEYS.USER_TYPE: user.usertype,
      Constants.APP_KEYS.USER_ID: user.userid
    });

    SharedPreferencesService.setPreference(
      Constants.APP_KEYS.ACCESS_TOKEN,
      user.token,
    );
    SharedPreferencesService.setPreference(
      Constants.APP_KEYS.ACCESS_USER,
      user.name,
    );
    
    Modular.to.pushNamedAndRemoveUntil('/home-donor', (p0) => false);

    return true;
  }

  /*
  void silentLogin() async {
    //
    //GETS TOKEN AND STORES IN STATE MANAGER
    String? token = await SharedPreferencesService.getPreference(
      Constants.APP_KEYS.ACCESS_TOKEN,
    );
    _authRepository.setToken(token);

    if (_authRepository.token != null && _authRepository.token!.isNotEmpty) {
      //
      //GETS USERNAME AND STORES IN STATE MANAGER
      String? accessUser = await SharedPreferencesService.getPreference(
        Constants.APP_KEYS.ACCESS_USER,
      );
      _authRepository.setUsername(accessUser);
      //
      //GETS USER INFO AND STORES IN STATE MANAGER
      _authRepository.setUserInformation(_getUserInfoFromToken(token));
      //
      //
      _authRepository.setIsLoggedIn(true);
      Modular.to.pushNamedAndRemoveUntil('/home', (p0) => false);
    }
  }
  */

  static Map<String, dynamic> _getUserInfoFromToken(String? token) {
    if (token == null) return {};
    return JwtDecoder.decode(token);
  }

  void logout() {
    _authRepository.setUsername("");
    _authRepository.setIsLoggedIn(false);
    _authRepository.setUserInformation({
      Constants.APP_KEYS.USER_TYPE: null,
      Constants.APP_KEYS.USER_ID: null
    });   
    SharedPreferencesService.setPreference(Constants.APP_KEYS.ACCESS_TOKEN, "");
    Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false,);
  }
}
