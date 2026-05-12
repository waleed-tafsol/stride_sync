import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/custom_app_bar.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class HorsesPage extends StatelessWidget {
  const HorsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Horses",
        leadingWidget: Icon(Icons.menu, size: 30.sp),
        actionIcon: TablerIcons.bell,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 30.h),
            Text("All Horses", style: AppFonts.black20w700),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by name or breed...",
                      prefixIcon: Icon(TablerIcons.search, size: 24.sp),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonGradient,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.buttonBorder),
                  ),
                  child: Icon(
                    TablerIcons.filter,
                    size: 30.sp,
                    color: AppColors.white,
                  ),
                ),
                
              ],
            ),
             SizedBox(width: 20.w),
             
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},

        child: Container(
          height: 50.h,
          width: 50.w,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            gradient: AppColors.buttonGradient,
            border: Border.all(color: AppColors.buttonBorder),
            shape: BoxShape.circle,
          ),
          child: Icon(TablerIcons.plus, size: 30.sp, color: AppColors.white),
        ),
      ),
    );
  }
}
