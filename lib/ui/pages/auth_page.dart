import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/pages/forgot_password_page.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/dialog%20box/verify_email_dialog.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:stride_sync/ui/widgets/text_form_field_with_title_widget.dart';
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
                SizedBox(height: 10.h),
                ValueListenableBuilder<bool>(
                  valueListenable: isSignInPressed,
                  builder: (context, isSignPressed, child) {
                    if (isSignPressed) {
                      return _builSignIn(context: context);
                    }
                    return _buildRegister(context: context);
                  },
                ),
                SizedBox(height: MediaQuery.paddingOf(context).bottom + 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _builSignIn({required BuildContext context}) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        TextFormFieldWithTitleWidget(
          title: 'Email',
          controller: TextEditingController(),
          hintText: "Johndoe@gmail.com",
          prefixIcon: TablerIcons.mail,
        ),
        TextFormFieldWithTitleWidget(
          title: 'Password',
          controller: TextEditingController(),
          hintText: "*********",
          prefixIcon: TablerIcons.lock,
          suffixIcon: TablerIcons.eyeOff,
        ),

        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordPage.routeName);
          },
          child: Align(
            alignment: AlignmentGeometry.centerEnd,
            child: Text("Forgot Password?", style: AppFonts.brown14w400),
          ),
        ),
        SizedBox(height: 20.h),
        GradientButton(text: "Sign In", onPressed: () {}),
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

  Widget _buildRegister({required BuildContext context}) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 10.h),
        Center(
          child: Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  DummyAssets.profile,
                  height: 96.w,
                  width: 96.w,
                ),
              ),
              Positioned(
                right: 1.w,
                bottom: 1.h,
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondary,
                    border: .all(color: AppColors.white, width: 2.w),
                  ),
                  child: Icon(
                    TablerIcons.upload,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextFormFieldWithTitleWidget(
          title: 'Full Name',
          controller: TextEditingController(),
          hintText: "John Doe",
          prefixIcon: TablerIcons.user,
        ),
        TextFormFieldWithTitleWidget(
          title: 'Organization Name',
          controller: TextEditingController(),
          hintText: "Name Here",
          prefixIcon: TablerIcons.building,
        ),
        TextFormFieldWithTitleWidget(
          title: 'Email',
          controller: TextEditingController(),
          hintText: "Johndoe@gmail.com",
          prefixIcon: TablerIcons.mail,
        ),
        TextFormFieldWithTitleWidget(
          title: 'Create Password',
          controller: TextEditingController(),
          hintText: "*********",
          prefixIcon: TablerIcons.lock,
          suffixIcon: TablerIcons.eyeOff,
        ),
        TextFormFieldWithTitleWidget(
          title: 'Confirm Password',
          controller: TextEditingController(),
          hintText: "*********",
          prefixIcon: TablerIcons.lock,
          suffixIcon: TablerIcons.eyeOff,
        ),
        SizedBox(height: 20.h),
        GradientButton(
          text: "Sign In",
          onPressed: () {
            showVerifyEmailDialog(
              context,
              email: 'saad@yopmail.com',
              onVerify: () {},
              onResend: () {},
            );
          },
        ),

        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: .center,
          children: [
            Text("Already Have an Account ? ", style: AppFonts.black14w400),
            Text('Sign In', style: AppFonts.brown14w400),
          ],
        ),
      ],
    );
  }
}
