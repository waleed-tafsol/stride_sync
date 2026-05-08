import 'package:flutter/material.dart';

import '../../../services/locator.dart';
import 'base_view_model.dart';

class ThemeViewModel extends BaseViewModel {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode value) {
    if (_themeMode != value) {
      _themeMode = value;
      notifyListeners();
      locator<SecureStorageService>().saveThemeMode(value);
    }
  }

  @override
  void init() {
    super.init();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final mode = await locator<SecureStorageService>().readThemeMode();
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  void setThemeMode(ThemeMode value) {
    themeMode = value;
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }
}
