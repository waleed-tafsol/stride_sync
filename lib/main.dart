import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'services/locator.dart';
import 'stride_sync.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await ScreenUtil.ensureScreenSize();
  runApp(ProviderScope(child: const StridSyncApp()));
}
