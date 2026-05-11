import 'package:flutter/material.dart';
import 'package:stride_sync/ui/view_models/base_view_model.dart';

class BottomNavProvider extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}