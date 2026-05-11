import 'package:flutter/material.dart';
import 'package:stride_sync/ui/pages/auth_page.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";

  const SplashPage({super.key});
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(
      context,
      AuthPage.routeName,
    ); // Delay of 3 seconds
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'STRIDE SYNC',
          style: AppFonts.SplashTexT35w700.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
