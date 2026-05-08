import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

part 'secure_storage_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  await locator.reset();
  locator.registerSingleton(SecureStorageService._());
}
