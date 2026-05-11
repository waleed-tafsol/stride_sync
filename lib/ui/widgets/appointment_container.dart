import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/pages/home_page.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/utils/enums.dart';

class AppointmentContainer extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentContainer({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ← fixes tag alignment
        children: [
          // Date Box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              "${appointment.month}\n${appointment.day}",
              textAlign: TextAlign.center,
              style: AppFonts.black16w400,
            ),
          ),
          SizedBox(width: 10.w),

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appointment.title, style: AppFonts.black14w400),
                SizedBox(height: 4.h),
                Text(appointment.subtitle, style: AppFonts.grey10w400),
              ],
            ),
          ),

          // Type Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: appointment.type.backGroundColor,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Text(
              appointment.type.label,
              style: AppFonts.grey10w400.copyWith(
                color: appointment.type.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}