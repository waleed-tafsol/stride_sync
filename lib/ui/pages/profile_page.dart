import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile Setting',
                    style: AppFonts.black20w600,
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      gradient: AppColors.buttonGradient,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.buttonBorder, width: 1.w),
                    ),
                    child: Icon(
                      Icons.settings_outlined,
                      color: AppColors.white,
                      size: 22.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              // Profile Info Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                  gradient: AppColors.greyToLightBrown,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 128.w,
                          height: 128.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width: 4.w),
                            image: const DecorationImage(
                              image: NetworkImage("https://placehold.co/128x128"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x14564336),
                                blurRadius: 40.r,
                                offset: Offset(0, 20.h),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 4.w,
                          bottom: 4.h,
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.white, width: 2.w),
                            ),
                            child: Icon(
                              Icons.check_circle,
                              color: AppColors.white,
                              size: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Alex Miller',
                      style: AppFonts.black18w400.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.9,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'alex.miller@equitrackpro.com',
                      style: AppFonts.black14w400.copyWith(
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              // Subscription Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            gradient: AppColors.buttonGradient,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: AppColors.buttonBorder, width: 1.25.w),
                          ),
                          child: Icon(
                            Icons.stars,
                            color: AppColors.white,
                            size: 25.sp,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Subscription',
                                style: AppFonts.brown14w400.copyWith(letterSpacing: -0.4),
                              ),
                              Text(
                                'Pro Plan - Active',
                                style: AppFonts.black18w400.copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: AppColors.textGrey,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: GradientButton(
                            text: 'Upgrade Plan',
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(50.r),
                                border: Border.all(color: AppColors.buttonBorder, width: 1.w),
                              ),
                              child: Center(
                                child: Text(
                                  'Payment History',
                                  style: AppFonts.white16w500.copyWith(letterSpacing: -0.8),
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
              SizedBox(height: 30.h),
              // Settings List Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    _buildSettingTile(
                      icon: Icons.person_outline,
                      title: 'Edit Profile',
                      onTap: () {},
                    ),
                    SizedBox(height: 12.h),
                    _buildSettingTile(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      onTap: () {},
                    ),
                    SizedBox(height: 12.h),
                    _buildSettingTile(
                      icon: Icons.notifications_none,
                      title: 'Notifications',
                      trailing: Switch(
                        value: true,
                        onChanged: (v) {},
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.secondary,
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: 12.h),
                    _buildSettingTile(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    GradientButton(
                      text: 'Logout',
                      icon: Icons.logout,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondary, size: 24.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: AppFonts.black14w400.copyWith(
                  fontSize: 15.sp,
                  letterSpacing: -0.4,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: AppColors.textGrey,
                ),
          ],
        ),
      ),
    );
  }
}