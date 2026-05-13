import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../../constant/assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/app_back_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/gradient_button.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = '/edit-profile-screen';

  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidget: AppBackButton(),
        title: 'Edit Profile',
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.w),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
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
                        image:  DecorationImage(
                          image: AssetImage(DummyAssets.profile),
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
                          TablerIcons.upload,
                          color: AppColors.white,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'Upload Photo',
                  style: AppFonts.black18w600,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Format should be in .jpeg .png atleast 800x800px and less than 5MB',
                  style: AppFonts.grey14w500,

                ),
              ],
            ),
          ),


        ],),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 50.h,
                    alignment: Alignment.center,
                    child: Text("Cancel", style: AppFonts.brown16w500),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: GradientButton(
                    text: 'Save Changes',
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
