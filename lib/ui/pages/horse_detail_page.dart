import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/app_back_button.dart';
import 'package:stride_sync/utils/enums.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class HorseDetailPage extends StatelessWidget {
  static const String routeName = '/horse-detail';

  const HorseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBackButton(),
            SizedBox(width: 16.w),

            Text("Bella Details", style: AppFonts.black20w600),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.buttonBorder),
              ),
              child: Icon(
                TablerIcons.share,
                size: 22.sp,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: 10.w),
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
                  Icons.more_vert,
                  size: 22.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildImageContainer(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(20.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Vital Statistics", style: AppFonts.black20w700),
                    SizedBox(height: 15.h),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: .all(color: AppColors.borderColor),
                      ),

                      child: Row(
                        children: [
                          Icon(
                            TablerIcons.calendarWeek,
                            size: 22.sp,
                            color: AppColors.secondary,
                          ),
                          SizedBox(width: 10.w),
                          Text("Age", style: AppFonts.black14w400),
                          Spacer(),
                          Text('8 Years', style: AppFonts.brown16w500),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    _buildEraningContainer(),
                    SizedBox(height: 32.h),
                    Text("About Bella", style: AppFonts.black20w700),
                    SizedBox(height: 5.h),
                    Text(
                      "Bella is a high-performance show jumper with an exceptional temperament and a keen focus on competition. She has been part of the EquiTrack Pro stable for three years, consistently demonstrating elite-level agility and a remarkable jumping technique. She requires a specialized high-protein diet and twice-weekly physiotherapy to maintain her competitive edge.",
                      style: AppFonts.black16w400,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildBreedContainer(
                            title: "Top Speed",
                            value: "Oct 12, 2023",
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildBreedContainer(
                            title: "Feed",
                            value: "Dutch Warmblood",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildBreedContainer(
                            title: "Color",
                            value: "Brown",
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildBreedContainer(
                            title: "Feed",
                            value: "Dutch Warmblood",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _buildBreedContainer(
                      width: double.infinity,
                      title: "Last Vet Check",
                      value: "Oct 12, 2023",
                    ),
                    SizedBox(height: 32.h),
                    Text("Owner Info", style: AppFonts.black20w700),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildBreedContainer(
                            color: AppColors.scaffoldBackground,
                            title: "First Name",
                            value: "John",
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildBreedContainer(
                            color: AppColors.scaffoldBackground,
                            title: "Last Name",
                            value: "Doe",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _buildBreedContainer(
                      color: AppColors.scaffoldBackground,
                      width: double.infinity,
                      title: "Contact Number",
                      value: "000 000 0000",
                    ),
                    SizedBox(
                      height: MediaQuery.paddingOf(context).bottom + 24.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreedContainer({
    required String title,
    required String value,
    double? width,
    Color? color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: width,
      decoration: BoxDecoration(
        color: color ?? AppColors.lightBrown,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(title, style: AppFonts.black14w400),
          Text(value, style: AppFonts.brown16w500),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 289.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(DummyAssets.horseDetail)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Spacer(),
            Row(
              crossAxisAlignment: .start,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Bella", style: AppFonts.white16w700),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.footPrint,
                          height: 12.h,
                          width: 12.w,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.w),
                        Text("Arabian Mare", style: AppFonts.white14w400),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppointmentType.health.backGroundColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Text(
                    AppointmentType.health.label,
                    style: AppFonts.grey10w400.copyWith(
                      color: AppointmentType.health.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEraningContainer() {
    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
        bottom: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Lifetime Earning', style: AppFonts.white13w400),
              Text('£124545.99', style: AppFonts.white42w500),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: AppColors.buttonBorder, width: 2.w),
            ),
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.buttonGradient,
              ),
              child: Icon(
                TablerIcons.businessplan,
                size: 22.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
