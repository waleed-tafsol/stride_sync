import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stride_sync/ui/view_models/bottom_nav_view_model.dart';

import '../widgets/custom_bottom_nav.dart';
import 'event_page.dart';
import 'home_page.dart';
import 'horse_page.dart';
import 'profile_page.dart';

class BottomNavPage extends StatelessWidget {
  static const String routeName = "/bottom_nav_page";

  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.read(bottomNavProvider);

        return Scaffold(
          body: switch (currentIndex) {
            0 => HomePage(),
            1 => HorsePage(),
            2 => EventPage(),
            3 => ProfilePage(),
            int() => throw UnimplementedError(),
          },
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
