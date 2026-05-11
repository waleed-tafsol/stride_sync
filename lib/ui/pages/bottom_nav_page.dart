import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stride_sync/ui/pages/event_page.dart';
import 'package:stride_sync/ui/pages/home_page.dart';
import 'package:stride_sync/ui/pages/horses_page.dart';
import 'package:stride_sync/ui/pages/profile_page.dart';
import 'package:stride_sync/ui/view_models/bottom_nav_view_model.dart';
import 'package:stride_sync/ui/widgets/custom_bottom_nav.dart';

class BottomNavPage extends StatelessWidget {
  static const String routeName = "/bottom_nav_page";

  const BottomNavPage({super.key});

  // Map index to your screens
  static const List<Widget> _screens = [
    HomePage(),
    HorsesPage(),
    EventPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomNavProvider>().currentIndex;

    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
