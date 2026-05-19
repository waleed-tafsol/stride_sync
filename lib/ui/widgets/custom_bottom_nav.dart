import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/bottom_nav_view_model.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(bottomNavProvider);

    final items = [
      _NavItem(icon: TablerIcons.home, label: "Home"),
      _NavItem(icon: TablerIcons.horseToy, label: "Horses"),
      _NavItem(icon: TablerIcons.calendarEvent, label: "Event"),
      _NavItem(icon: TablerIcons.userCircle, label: "Profile"),
    ];

    return SafeArea(
      left: true,

      right: true,
      top: false,

      child: Container(
        height: 92.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isSelected = currentPage == index;
            return Expanded(
              child: GestureDetector(
                onTap: () =>
                    ref.read(bottomNavProvider.notifier).setIndex(index),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: isSelected
                      ? BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF7C5C3E),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(14.r),
                        )
                      : const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[index].icon,
                        size: 21.sp,
                        color: isSelected
                            ? AppColors.secondary
                            : AppColors.textGrey,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        items[index].label,
                        style: AppFonts.grey12w400.copyWith(
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.textGrey,
                        ),
                        // TextStyle(
                        //   fontSize: 12.sp,
                        //   fontWeight: isSelected
                        //       ? FontWeight.w600
                        //       : FontWeight.w400,
                        // color: isSelected
                        //     ? AppColors.secondary
                        //     : const Color(0xFF9E9E9E),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
