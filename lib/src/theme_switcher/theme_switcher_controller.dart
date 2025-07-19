import 'package:flutter/material.dart';

class ThemeSwitcherController extends ChangeNotifier {
  bool _isDark = false;
  final bool useSystemTheme;

  ThemeSwitcherController({this.useSystemTheme = true});

  void initialize() {
    if (useSystemTheme) {
      _isDark = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    }
  }

  bool get isDark => _isDark;

  void toggleTheme() {
    if (!useSystemTheme) {
      _isDark = !_isDark;
      notifyListeners();
    }
  }

  void setDark(bool value) {
    if (!useSystemTheme) {
      _isDark = value;
      notifyListeners();
    }
  }
}
