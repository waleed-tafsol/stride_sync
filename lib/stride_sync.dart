import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stride_sync/ui/pages/splash_page.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/resources/design_size.dart';
import 'package:stride_sync/routes/app_routes.dart';
import 'package:stride_sync/ui/themes/app_theme.dart';
import 'package:stride_sync/ui/view_models/auth_view_model.dart';
import 'package:stride_sync/ui/view_models/theme_view_model.dart';

class StridSyncApp extends StatelessWidget {
  const StridSyncApp({super.key});

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0.h
      ..errorWidget = Icon(Icons.error, color: Colors.red, size: 45.0.sp)
      ..radius = 10.0.r
      ..progressColor = AppColors.primary
      ..backgroundColor = Colors.white
      ..boxShadow = [
        BoxShadow(color: Colors.grey.withValues(alpha: 0.5), blurRadius: 10),
      ]
      ..indicatorColor = AppColors.primary
      ..textColor = AppColors.primary
      ..textStyle = TextStyle(
        fontFamily: AppFonts.fontFamily,
        color: AppColors.primary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      )
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: getDesignSize(context, constraints),
          ensureScreenSize: true,
          minTextAdapt: true,
          splitScreenMode: true,
          child: Consumer<ThemeViewModel>(
            builder: (_, vm, _) {
              return MaterialApp(
               
                debugShowCheckedModeBanner: false,
                navigatorKey: AppRoutes.navigatorKey,
                title: 'Curly Connections',
                themeMode: vm.themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.lightTheme,
               initialRoute: SplashPage.routeName,
                onGenerateRoute: AppRoutes.routes,
                builder: (_, child) {
                  configLoading();
                  return MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: MultiProvider(
                      providers: [
                        ChangeNotifierProvider(create: (_) => AuthViewModel()),
                      ],
                      builder: (_, _) {
                        return FlutterEasyLoading(child: child);
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
