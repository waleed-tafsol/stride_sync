import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';

Future<void> showEmailSentDialog(
  BuildContext context, {
  VoidCallback? onGoToLogin,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black38,
    builder: (_) => EmailSentDialog(onGoToLogin: onGoToLogin),
  );
}

class EmailSentDialog extends StatelessWidget {
  const EmailSentDialog({super.key, this.onGoToLogin});

  final VoidCallback? onGoToLogin;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 10,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 26.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 92.w,
              width: 92.w,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withValues(alpha: 0.35),
                    blurRadius: 12.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 36.sp,
              ),
            ),
            SizedBox(height: 24.h),

            Text(
              'Email Successfully Sent!',
              textAlign: TextAlign.center,
              style: AppFonts.black18w700,
            ),
            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                "We've sent a password reset link to the email address you provided. Please check your inbox.",
                textAlign: TextAlign.center,
                style: AppFonts.grey14w500,
              ),
            ),
            SizedBox(height: 24.h),
            GradientButton(
              text: 'Login',
              onPressed: () {
                onGoToLogin?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
