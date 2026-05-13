import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsetsGeometry.all(6.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: .all(color: AppColors.containerBorder),
          color: AppColors.containerBorder.withValues(alpha: 0.2),
        ),

        child: Icon(TablerIcons.arrowLeft, size: 22.sp, color: AppColors.black),
      ),
    );
  }
}
