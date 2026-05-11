import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,

        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                DummyAssets.profile,
                height: 40.w,
                width: 40.w,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text("Good morning", style: AppFonts.grey16w400),
                Text("Jenny Wilson", style: AppFonts.brown20w700),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.buttonBorder),
                ),
                child: Icon(
                  TablerIcons.bell,
                  size: 22.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 33.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: AppColors.greyToLightBrown,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.fillColor,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.secondary,
                                  ),
                                  color: AppColors.lightBrown,
                                ),
                                child: Icon(
                                  TablerIcons.horseToy,
                                  size: 20.sp,
                                  color: AppColors.secondary,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text("Total Horses", style: AppFonts.black16w400),
                              Text("12", style: AppFonts.brown20w500),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.fillColor,
                          ),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.secondary,
                                  ),
                                  color: AppColors.lightBrown,
                                ),
                                child: Icon(
                                  TablerIcons.horseToy,
                                  size: 20.sp,
                                  color: AppColors.secondary,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text("Subscription", style: AppFonts.black16w400),
                              Text("Personal Pro", style: AppFonts.brown20w500),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: GradientButton(
                          text: "Add Horse",
                          onPressed: () {},
                          icon: TablerIcons.plus,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(50.r),
                          child: Ink(
                            height: 56.h,
                            width: double.infinity,

                            padding: EdgeInsets.symmetric(vertical: 10.h),

                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: .center,
                                children: [
                                  Icon(
                                    TablerIcons.calendar,
                                    size: 15.sp,
                                    color: AppColors.white,
                                  ),

                                  SizedBox(width: 10.w),
                                  Text(
                                    "Create Event",
                                    style: AppFonts.white16w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
