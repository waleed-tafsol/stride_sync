import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/dialog%20box/email_sent_successfully_dialog.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:stride_sync/ui/widgets/text_form_field_with_title_widget.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const String routeName = "/forgot-password";

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 107.h),
            Text("Forgot Password?", style: AppFonts.brown32w700),
            SizedBox(height: 5.h),
            Text(
              "Enter your email to get a Reset Link",
              style: AppFonts.black16w400,
            ),
            SizedBox(height: 30.h),
            TextFormFieldWithTitleWidget(
              title: "Email",
              controller: TextEditingController(),
              hintText: "Johndoe@gmail.com",
              prefixIcon: TablerIcons.mail,
            ),
            SizedBox(height: 20.h),
            GradientButton(
              text: "Reset Password",
              onPressed: () {
                showEmailSentDialog(
                  context,
                  onGoToLogin: () {
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
