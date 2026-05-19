import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/locator.dart';
import 'base_view_model.dart';

class ThemeViewModel extends BaseViewModel<ThemeMode> {
  ThemeViewModel._() : super(ThemeMode.light);

  set themeMode(ThemeMode value) {
    if (state != value) {
      state = value;
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
    if (state != mode) {
      state = mode;
    }
  }

  void setThemeMode(ThemeMode value) {
    themeMode = value;
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }
}

final themeProvider = NotifierProvider.autoDispose(() => ThemeViewModel._());
