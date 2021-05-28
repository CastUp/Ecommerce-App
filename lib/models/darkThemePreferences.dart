import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences{

  static const String TheStatus = "THEMESTATUS";

  Future<void> setDarkTheme(bool value) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(TheStatus, value);
  }

  Future<bool> getDarkTheme ()async {

    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(TheStatus) ?? false;
  }

}