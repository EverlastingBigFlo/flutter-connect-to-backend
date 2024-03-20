// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreference {
  // static CustomSharedPreference? _instance;
  static SharedPreferences? _prefs;

  CustomSharedPreference(){
    getInstance();
  }

   Future getInstance() async {
   
    _prefs ??= await SharedPreferences.getInstance();
    // return _instance!;
  }
  
  Future<void> setString(String key, String value) async {
    _prefs!.setString(key, value);
  }

  String? getString(String key)  {
     return _prefs!.getString(key);
  }
}
