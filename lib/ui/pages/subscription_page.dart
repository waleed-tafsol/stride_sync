import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/models/dummy%20model/plan_model.dart';
import 'package:stride_sync/ui/pages/bottom_nav_page.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/custom_app_bar.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class SubscriptionPage extends StatefulWidget {
  static const String routeName = "/subscription_page";

  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

final ValueNotifier<bool> isMonthly = ValueNotifier<bool>(true);

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Subscription",
        leadingWidget: Icon(Icons.menu, size: 30.sp),
        actionIcon: TablerIcons.bell,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text("Choose Your Plan", style: AppFonts.black20w700),
            SizedBox(height: 8.h),
            Text(
              "Unlock features that fit your needs",
              style: AppFonts.black16w400,
            ),
            SizedBox(height: 23.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: .all(color: AppColors.borderColor),
              ),
              child: ValueListenableBuilder<bool>(
                valueListenable: isMonthly,
                builder: (context, isSignPressed, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isMonthly.value = true;
                          },
                          child: Container(
                            alignment: .center,
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                              color: isSignPressed
                                  ? AppColors.black
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              border: .all(color: AppColors.black),
                            ),
                            child: Text(
                              "Monthly",
                              style: AppFonts.white18w400.copyWith(
                                color: isSignPressed
                                    ? AppColors.white
                                    : AppColors.textBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isMonthly.value = false;
                          },
                          child: Container(
                            alignment: .center,
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                              color: isSignPressed
                                  ? AppColors.white
                                  : AppColors.black,

                              borderRadius: BorderRadius.circular(8.r),
                              border: .all(color: AppColors.black),
                            ),
                            child: Text(
                              "Yearly",
                              style: AppFonts.white18w400.copyWith(
                                color: isSignPressed
                                    ? AppColors.textBlack
                                    : AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 17.h),
            ValueListenableBuilder<bool>(
              valueListenable: isMonthly,
              builder: (context, isSignPressed, child) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    shrinkWrap: true,

                    itemCount: isMonthly.value
                        ? mothlyPlans.length
                        : yearlyPlans.length,
                    itemBuilder: (context, index) {
                      return _buildPlanContainer(planModel: mothlyPlans[index]);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Row _buildIncludedRow({required String text}) {
    return Row(
      children: [
        Container(
          height: 24.w,
          width: 24.w,
          decoration: BoxDecoration(
            gradient: AppColors.buttonGradient,
            shape: BoxShape.circle,
          ),
          child: Icon(TablerIcons.check, size: 16.sp, color: AppColors.white),
        ),
        SizedBox(width: 10.w),
        Text(text, style: AppFonts.black18w400),
      ],
    );
  }

  Container _buildPlanContainer({required PlanModel planModel}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: .all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: .start,

        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isMonthly.value
                  ? AppColors.lightBrown
                  : AppColors.secondary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.only(left: 16.w),

            child: Column(
              crossAxisAlignment: .start,

              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        gradient: AppColors.buttonGradient,
                        shape: BoxShape.circle,
                        border: .all(color: AppColors.buttonBorder),
                      ),
                      child: SvgPicture.asset(
                        planModel.icon,
                        height: 28.h,
                        width: 28.w,
                      ),
                    ),
                    if (planModel.isRecommended)
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Container(
                          padding: .symmetric(horizontal: 16.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.lightBrown1,
                          ),
                          child: Text(
                            "Recommended",
                            style: AppFonts.brown18w400,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  planModel.title,
                  style: AppFonts.brown30w400.copyWith(
                    color: isMonthly.value
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "£${planModel.price}",
                      style: AppFonts.black42w500.copyWith(
                        color: isMonthly.value
                            ? AppColors.secondary
                            : AppColors.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      isMonthly.value ? "Monthly plan" : 'Yearly plan',
                      style: AppFonts.black13w400.copyWith(
                        color: isMonthly.value
                            ? AppColors.secondary
                            : AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          Divider(height: 0.h, color: AppColors.borderColor),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 35.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text("What's included:", style: AppFonts.darkBrown20w700),
                SizedBox(height: 20.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 21.h);
                  },
                  itemCount: planModel.features.length,
                  itemBuilder: (context, index) {
                    return _buildIncludedRow(text: planModel.features[index]);
                  },
                ),

                SizedBox(height: 91.h),
                GradientButton(
                  text: planModel.buttonText,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      BottomNavPage.routeName,
                      (route) => false,
                    );
                  },
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
