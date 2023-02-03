import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static dynamic getPreference(String key) async {
    try {
      final storeService = await SharedPreferences.getInstance();
      return storeService.get(key);
    }
    //
    catch (e) {
      return false;
    }
  }

  static Future<bool> setPreference(String key, value) async {
    try {
      final storeService = await SharedPreferences.getInstance();
      if (value.runtimeType.toString() == 'String') {
        storeService.setString(key, value);
        return true;
      } 
      //
      else if (value.runtimeType.toString() == 'int') {
        storeService.setInt(key, value);
        return true;
      } 
      //
      else if (value.runtimeType.toString() == 'List<String>') {
        storeService.setStringList(key, value);
        return true;
      }
      return false;
    }
    //
    catch (e) {
      return false;
    }
  }
}
