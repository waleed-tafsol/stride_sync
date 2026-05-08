import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../exceptions/app_exception.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _loading = false;

  BaseViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  bool get loading {
    return _loading;
  }

  @mustCallSuper
  void init() {
    log('INITIALIZING $runtimeType', name: 'PROVIDER');
  }

  Future<T?> runSafely<T>(AsyncValueGetter<T> action) async {
    try {
      return await action.call();
    } on AppException catch (e, s) {
      log(e.message, stackTrace: s);
      handleError(e.message);
      return null;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      handleError(e.toString().replaceAll('Exception:', ''));
      return null;
    }
  }

  @mustCallSuper
  void handleError(String message) {
    EasyLoading.showError(message);
  }

  @mustCallSuper
  @override
  void dispose() {
    log('DISPOSING $runtimeType', name: 'PROVIDER');
    super.dispose();
  }
}
