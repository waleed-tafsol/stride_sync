import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stride_sync/ui/pages/event_page.dart';
import 'package:stride_sync/ui/pages/home_page.dart';
import 'package:stride_sync/ui/pages/horses_page.dart';
import 'package:stride_sync/ui/pages/profile_page.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/view_models/bottom_nav_view_model.dart';
import 'package:stride_sync/ui/widgets/custom_bottom_nav.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import 'add_event_screen.dart';

class BottomNavPage extends StatelessWidget {
  static const String routeName = "/bottom_nav_page";

  const BottomNavPage({super.key});

  static const List<Widget> _screens = [
    HomePage(),
    HorsesPage(),
    EventPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        final currentIndex = bottomNavProvider.currentIndex;

        return Scaffold(
          body: _screens[currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
