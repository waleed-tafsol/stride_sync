import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = "/login";

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSignInPressed = ValueNotifier<bool>(true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 107.h),
                Center(
                  child: Text("Welcome Back! 👋", style: AppFonts.black32w700),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: Text(
                    "Sign in or Create a new account",
                    style: AppFonts.grey16w400,
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: .all(color: AppColors.broderColor),
                  ),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isSignInPressed,
                    builder: (context, isSignPressed, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                isSignInPressed.value = true;
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
                                  "Sign In",
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
                                isSignInPressed.value = false;
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
                                  "Register",
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
                SizedBox(height: 30.h),
                _builSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _builSignUp() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text("Email", style: AppFonts.grey18w400, textAlign: .start),
        SizedBox(height: 20.h),
        TextField(
          decoration: InputDecoration(
            hintText: "Johndoe@gmail.com",
            prefixIcon: Icon(
              TablerIcons.mail,
              color: AppColors.secondary,
              size: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text("Password", style: AppFonts.grey18w400, textAlign: .start),
        SizedBox(height: 20.h),
        TextField(
          decoration: InputDecoration(
            hintText: "*********",
            prefixIcon: Icon(
              TablerIcons.lock,
              color: AppColors.secondary,
              size: 24.sp,
            ),
            suffixIcon: Icon(
              TablerIcons.eyeOff,
              color: AppColors.secondary,
              size: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Align(
          alignment: AlignmentGeometry.centerEnd,
          child: Text("Forgot Password?", style: AppFonts.brown14w400),
        ),
        SizedBox(height: 20.h),
        Container(
          alignment: .center,
          width: double.infinity,
          height: 56.h,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            gradient: AppColors.buttonGradient,
            borderRadius: BorderRadius.circular(50.r),
            border: .all(color: AppColors.buttonBorder),
          ),
          child: Text("Sign In", style: AppFonts.white16w500),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: .center,
          children: [
            Text("Already Have an Account ? ", style: AppFonts.black14w400),
            Text('Sign Up', style: AppFonts.brown14w400),
          ],
        ),
      ],
    );
  }
}
