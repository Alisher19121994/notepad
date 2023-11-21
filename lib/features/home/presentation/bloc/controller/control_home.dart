import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier{
  late String title;
  late String description;
  late String date;
  late String dateTime;

  String currentTheme = 'system';

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('theme', theme);

    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    currentTheme = _prefs.getString('theme') ?? 'system';
    notifyListeners();
  }

  // ThemeData? _selectedTheme;
  // Typography? defaultTypography;
  // SharedPreferences? prefs;
  //
  // ThemeData dark = ThemeData.dark().copyWith();
  //
  // ThemeData light = ThemeData.light().copyWith();
  //
  // //HomeController(bool isDarkTheme);
  //
  // ThemeProvider(bool darkThemeOn) {
  //   _selectedTheme = darkThemeOn ? dark : light;
  // }
  //
  // Future<void> swapTheme() async {
  //   prefs = await SharedPreferences.getInstance();
  //
  //   if (_selectedTheme == dark) {
  //     _selectedTheme = light;
  //     await prefs?.setBool("darkTheme", false);
  //   } else {
  //     _selectedTheme = dark;
  //     await prefs?.setBool("darkTheme", true);
  //   }
  //
  //   notifyListeners();
  // }
  //
  // ThemeData? getTheme() => _selectedTheme;

}