import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/criticity_model.dart';

class Validators {
  static String? validadeFields(String? value) {
    if (value == null || value.isEmpty) {
      return "O campo não pode ser vazio";
    }
    return null;
  }
}

class Utils {
  static getTimeOfDayFromString(String time) {
    return TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]),
    );
  }

  static getDateFormater() {
    return MaskTextInputFormatter(
      mask: '##/##/####',
      type: MaskAutoCompletionType.lazy,
    );
  }

  static getPhoneFormatter() {
    return MaskTextInputFormatter(
      mask: '(##) # ####-####',
      type: MaskAutoCompletionType.lazy,
    );
  }

  static getInsertTimeFormatter() {
    return MaskTextInputFormatter(
      mask: '##:##',
      type: MaskAutoCompletionType.lazy,
    );
  }

  static getCpfFormatter() {
    return MaskTextInputFormatter(
      mask: '###.###.###-##',
      type: MaskAutoCompletionType.lazy,
    );
  }

   static getCepFormater() {
    return MaskTextInputFormatter(
      mask: '#####-###',
      type: MaskAutoCompletionType.lazy,
    );
  }


  static MaterialColor getCriticityColorFromList(List<CriticityModel> list) {
    if (list
        .where((element) =>
            element.status == Constants.BLOOD_CENTER_CONSTANTS.CRITICAL)
        .isNotEmpty) {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.CRITICAL]!;
    } else if (list
        .where((element) =>
            element.status == Constants.BLOOD_CENTER_CONSTANTS.ALERT)
        .isNotEmpty) {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.ALERT]!;
    } else if (list
        .where((element) =>
            element.status == Constants.BLOOD_CENTER_CONSTANTS.ADEQUAD)
        .isNotEmpty) {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.ADEQUAD]!;
    } else {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.STABLE]!;
    }
  }

  static MaterialColor getCriticityColorFromStatus(String status) {
    if (status == Constants.BLOOD_CENTER_CONSTANTS.CRITICAL) {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.CRITICAL]!;
    } else if (status == Constants.BLOOD_CENTER_CONSTANTS.ALERT) {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.ALERT]!;
    } else if (status == Constants.BLOOD_CENTER_CONSTANTS.ADEQUAD) {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.ADEQUAD]!;
    } else {
      return Constants.BLOOD_CENTER_CONSTANTS
          .CRITICITY_COLORS[Constants.BLOOD_CENTER_CONSTANTS.STABLE]!;
    }
  }
}
