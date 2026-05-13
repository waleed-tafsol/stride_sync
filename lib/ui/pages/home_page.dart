import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/appointment_container.dart';
import 'package:stride_sync/ui/widgets/custom_app_bar.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:stride_sync/utils/enums.dart';
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
            _buildUserInfo(),
            SizedBox(height: 43.h),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Upcoming Appointments", style: AppFonts.black20w700),
                Text("View All", style: AppFonts.black13w400),
              ],
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return AppointmentContainer(appointment: appointments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
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
                          border: Border.all(color: AppColors.secondary),
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
                          border: Border.all(color: AppColors.secondary),
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
                  child: Container(
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
                          Text("Create Event", style: AppFonts.white16w500),
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
    );
  }
}

final List<AppointmentModel> appointments = [
  AppointmentModel(
    month: 'OCT',
    day: '12',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.health,
  ),
  AppointmentModel(
    month: 'OCT',
    day: '13',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.training,
  ),
  AppointmentModel(
    month: 'OCT',
    day: '12',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.career,
  ),
  AppointmentModel(
    month: 'OCT',
    day: '12',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.health,
  ),
  AppointmentModel(
    month: 'OCT',
    day: '13',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.training,
  ),
  AppointmentModel(
    month: 'OCT',
    day: '13',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.training,
  ),
  AppointmentModel(
    month: 'OCT',
    day: '13',
    title: 'Vet Checkup - Bella',
    subtitle: 'Annual vaccination and physical',
    type: AppointmentType.training,
  ),
];

class AppointmentModel {
  final String month;
  final String day;
  final String title;
  final String subtitle;
  final AppointmentType type;

  const AppointmentModel({
    required this.month,
    required this.day,
    required this.title,
    required this.subtitle,
    required this.type,
  });
}
