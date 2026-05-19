import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_view_model.dart';

class BottomNavProvider extends BaseViewModel<int> {
  BottomNavProvider._() : super(0);

  void setIndex(int index) {
    if (state == index) return;
    state = index;
  }
}

final bottomNavProvider = NotifierProvider.autoDispose(
  () => BottomNavProvider._(),
);
