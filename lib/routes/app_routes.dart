import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stride_sync/ui/pages/auth_page.dart';
import 'package:stride_sync/ui/pages/forgot_password_page.dart';
import 'package:stride_sync/ui/pages/splash_page.dart';

abstract final class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> routes(RouteSettings settings) {
    // final args = settings.arguments;
    return switch (settings.name) {
      SplashPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SplashPage.routeName),
        builder: (_) => const SplashPage(),
      ),
      AuthPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: AuthPage.routeName),
        builder: (_) => const AuthPage(),
      ),
      ForgotPasswordPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ForgotPasswordPage.routeName),
        builder: (_) => const ForgotPasswordPage(),
      ),

      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
