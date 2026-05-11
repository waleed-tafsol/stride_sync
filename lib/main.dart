import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stride_sync/ui/view_models/bottom_nav_view_model.dart';
import 'package:stride_sync/ui/view_models/theme_view_model.dart';

import 'stride_sync.dart';
import 'services/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ],

      child: const StridSyncApp(),
    ),
  );
}
