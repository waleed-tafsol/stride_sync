import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/pages/horse_detail_page.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/utils/enums.dart';

class HorseContainer extends StatelessWidget {
  final Status status;
  const HorseContainer({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HorseDetailPage.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: .all(color: AppColors.borderColor),
        ),
        child: Row(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Image.asset(DummyAssets.horseProfile, height: 74.h, width: 74.w),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [
                Text("Bella", style: AppFonts.black16w700),
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.footPrint,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 10.w),
                    Text("Arabian Mare", style: AppFonts.black14w400),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text("Barn Name: ", style: AppFonts.grey10w400),

                    Text("Clover", style: AppFonts.black10w500),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text("Color: ", style: AppFonts.grey10w400),
                    Container(
                      height: 8.w,
                      width: 8.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: AppColors.secondary,
                      ),
                    ),

                    Text(" Brown", style: AppFonts.brown10w500),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text("Birth Year ", style: AppFonts.grey10w400),

                    Text("2020", style: AppFonts.black10w500),
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: status.backGroundColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Text(
                status.label,
                style: AppFonts.grey10w400.copyWith(color: status.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
