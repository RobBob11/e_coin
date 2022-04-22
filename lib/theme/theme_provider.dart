import 'package:e_coin/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dark.dart';
import 'light.dart';

// themes
CustomTheme lightTheme = LightTheme();

ThemeData light = ThemeData(
    appBarTheme: lightTheme.appBarTheme,
    bottomNavigationBarTheme: lightTheme.bottomNavigationBarThemeData,
    cardTheme: lightTheme.cardTheme,
    elevatedButtonTheme: lightTheme.elevatedButtonThemeData,
    scaffoldBackgroundColor: lightTheme.scaffoldColor,
    textTheme: lightTheme.textTheme);

CustomTheme darkTheme = DarkTheme();

ThemeData dark = ThemeData(
    appBarTheme: darkTheme.appBarTheme,
    bottomNavigationBarTheme: darkTheme.bottomNavigationBarThemeData,
    cardTheme: darkTheme.cardTheme,
    elevatedButtonTheme: darkTheme.elevatedButtonThemeData,
    scaffoldBackgroundColor: darkTheme.scaffoldColor,
    textTheme: darkTheme.textTheme);

// theme-provider
class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _pref;
  bool? _darkTheme;
  bool? _isLoading;

  bool? get isLoading => _isLoading;
  bool? get darkTheme => _darkTheme;

  ThemeNotifier() {
    _isLoading = true;
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme!;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref?.getBool(key) ?? false;
    _isLoading = false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref?.setBool(key, _darkTheme!);
  }
}