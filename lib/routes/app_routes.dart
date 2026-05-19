import 'package:flutter/cupertino.dart';

import '../ui/pages/add_event_screen.dart';
import '../ui/pages/add_new_horse_page.dart';
import '../ui/pages/auth_page.dart';
import '../ui/pages/bottom_nav_page.dart';
import '../ui/pages/edit_profile.dart';
import '../ui/pages/forgot_password_page.dart';
import '../ui/pages/horse_detail_page.dart';
import '../ui/pages/splash_page.dart';
import '../ui/pages/subscription_page.dart';

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
      SubscriptionPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SubscriptionPage.routeName),
        builder: (_) => const SubscriptionPage(),
      ),
      BottomNavPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: BottomNavPage.routeName),
        builder: (_) => const BottomNavPage(),
      ),
      HorseDetailPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: HorseDetailPage.routeName),
        builder: (_) => const HorseDetailPage(),
      ),
      AddNewHorsePage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: AddNewHorsePage.routeName),
        builder: (_) => const AddNewHorsePage(),
      ),
      AddEventScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: AddEventScreen.routeName),
        builder: (_) => const AddEventScreen(),
      ),
      EditProfile.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: EditProfile.routeName),
        builder: (_) => const EditProfile(),
      ),

      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
