// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static System SYSTEM = const System();
  static AppColors APP_COLORS = const AppColors();
  static AuthConstants AUTH_CONSTANTS = const AuthConstants();
  static AppKeys APP_KEYS = const AppKeys();
  static HttpEndpoints HTTP_ENDPOINTS = const HttpEndpoints();
  static Roles ROLES = const Roles();
  static BloodCenterConstants BLOOD_CENTER_CONSTANTS =
      const BloodCenterConstants();
  static TermsConstants TERMS_CONSTANTS = const TermsConstants();
}

class HttpEndpoints {
  const HttpEndpoints();

  final String baseUrl = "http://localhost:8081";

  String get LOGIN => "$baseUrl/api/v1/account/login";
  String get SIGN_UP_DONOR => "$baseUrl/api/v1/donor/create";
  String get UPDATE_DONOR => "$baseUrl/api/v1/donor/update";
  String get GET_ALL_QUESTIONS => "$baseUrl/api/v1/pergunta/read-all";

  String get SIGN_UP_BLOODCENTER => "$baseUrl/api/v1/blood-center/create";
  String get UPDATE_BLOODCENTER => "$baseUrl/api/v1/blood-center/update";
  String get GET_ALL_BLOOD_CENTER => "$baseUrl/api/v1/blood-center/read-all";
  String get GET_BLOOD_CENTER_BY_ID =>
      "$baseUrl/api/v1/blood-center/read-by-id/";
  String get READ_ALL_BLOODCENTER_WITH_CRITICITY =>
      "$baseUrl/api/v1/blood-center/read-all-with-criticity";

  String get CREATE_BY_INTERVAL => "$baseUrl/api/v1/horario/create-by-interval";
  String get GET_SCHEDULES_BY_DATE =>
      "$baseUrl/api/v1/horario/get-schedules-by-date";
  String get GET_AVAILABLE_DAYTIME_BY_DATE =>
      "$baseUrl/api/v1/horario/available-times/";
  String get DELETE_DAYTIME_BY_ID => "$baseUrl/api/v1/horario/delete/";

  String get SCHEDULE => "$baseUrl/api/v1/scheduling/create";
  String get GET_SCHEDULES_BY_ID => "$baseUrl/api/v1/scheduling/get-by-id";
  String get GET_SCHEDULES_BY_CRITERIA =>
      "$baseUrl/api/v1/scheduling/get-by-criteria";
  String get DELETE_SCHEDULES_BY_ID => "$baseUrl/api/v1/scheduling/delete/";

  String get GET_DONOR_BY_ID => "$baseUrl/api/v1/donor/read-by-id/";

  String get DELETE_USER_BY_ID => "$baseUrl/api/v1/user/delete/";

  String get GET_BLOOD_CRITICITY_BY_BLOOD_CENTER_ID =>
      "$baseUrl/api/v1/banco-sangue/read-blood-criticity-by-id/";
  String get DELETE_BLOOD_CRITICITY_BY_ID =>
      "$baseUrl/api/v1/banco-sangue/delete-blood-criticity-by-id/";
  String get ADD_BLOOD_CRITICITY_BY_BLOOD_CENTER_ID =>
      "$baseUrl/api/v1/banco-sangue/create";
}

class AppKeys {
  const AppKeys();
  String get ACCESS_TOKEN => "ACCESS_TOKEN";
  String get ACCESS_USER => "ACCESS_USER";
  String get USER_TYPE => "USER_TYPE";
  String get USER_ID => "USER_ID";
  String get USER_INFORMATION => "USER_INFORMATION";
  String get START => "START";
  String get END => "END";
  String get JUMPS => "JUMPS";
  String get DAY => "DAY";
  String get SCHEDULE_TYPE => "SCHEDULE_TYPE";
  String get HEMOCENTRO_ID => "HEMOCENTRO_ID";
  String get SCHEDULE_ID => "SCHEDULE_ID";
  String get COMPLETED => "COMPLETED";
  String get PENDING => "PENDING";
}

class TermsConstants {
  const TermsConstants();

  String get TERMS_TEXT =>
      "O   Save  Lives   desenvolve   tecnologias \npara  que   os   candidatos  à  doação  de \nsangue e os hemocentros se aproximem, \ncriem  proximidade   de   forma  rápida  e \nprática. \nNão  cobramos  pelo  uso  da  plataforma \nSave Lives. \nNão vendemos  os  seus  dados pessoais \npara  anunciantes  nem   compartilhamos \ninformações   de   identificação   pessoal, \ncomo nome, endereço de email ou outras \ninformações    de    contato,    com     eles, \na menos  que tenhamos a sua permissão \nespecífica.";
}

class Roles {
  const Roles();

  String get USUARIO => "USUARIO";
  String get DONOR => "DONOR";
  String get HEMOCENTRO => "HEMOCENTRO";
  String get BLOOD_CENTER => "BLOOD_CENTER";
}

class BloodCenterConstants {
  const BloodCenterConstants();

  List<String> get BLOOD_TYPES =>
      ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

  String get STABLE => "ESTÁVEL";
  String get ADEQUAD => "ADEQUADO";
  String get ALERT => "ALERTA";
  String get CRITICAL => "CRÍTICO";
  List<String> get CRITICITY => [STABLE, ADEQUAD, ALERT, CRITICAL];

  Map<String, MaterialColor> get CRITICITY_COLORS => {
        "ESTÁVEL": Colors.green,
        "ADEQUADO": Colors.yellow,
        "ALERTA": Colors.orange,
        "CRÍTICO": Colors.red
      };

  Map<String, BitmapDescriptor> get HUE_COLORS => {
        "ESTÁVEL": BitmapDescriptor.defaultMarkerWithHue(120.0),
        "ADEQUADO": BitmapDescriptor.defaultMarkerWithHue(60.0),
        "ALERTA": BitmapDescriptor.defaultMarkerWithHue(30.0),
        "CRÍTICO": BitmapDescriptor.defaultMarkerWithHue(0.0)
      };
}

class AuthConstants {
  const AuthConstants();

  String get ROLES => "ROLES";
  String get ROLE => "ROLE";
  String get ADMIN => "ADMIN";
  String get USER => "USER";
  String get HERMOCENTRO => "HEMOCENTRO";
}

class AppColors {
  const AppColors();

  MaterialColor get PRIMARY_COLOR => Colors.red;
}

class System {
  const System();

  String get APP_NAME => "Save Lives";

  String get APP_VERSION => "v2.1.0";
}
