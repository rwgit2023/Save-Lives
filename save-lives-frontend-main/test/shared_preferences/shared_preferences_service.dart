class SharedPreferencesServiceMock{
  static dynamic getPreference(String key) async {
    try {
      if(key == "STRING"){
        return "STRING";
      }
      else if(key == "INT"){
        return 1;
      }
      else if(key == "List"){
        return ["ronan", "julia"];
      }
      else{
        return false;
      }
    }
    //
    catch (e) {
      return false;
    }
  }

  static Future<String> setPreference(String key, value) async {
    try {      
      if (value.runtimeType.toString() == 'String') {
        
        return "String";
      } 
      //
      else if (value.runtimeType.toString() == 'int') {
        return "int";
      } 
      //
      else if (value.runtimeType.toString() == 'List<String>') {
        return "List";
      }
      return "";
    }
    //
    catch (e) {
      return "";
    }
  }
}