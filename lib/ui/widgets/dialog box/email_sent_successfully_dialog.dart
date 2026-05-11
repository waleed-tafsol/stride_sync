import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 10,
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 60.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 28.h),

          // Check badge
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withOpacity(0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(height: 20.h),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Email Successfully\nSent!',
              textAlign: TextAlign.center,
              style: AppFonts.brown32w700,
            ),
          ),
          SizedBox(height: 16.h),

          // Subtitle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "We've sent a password reset link to the email address you provided. Please check your inbox.",
              textAlign: TextAlign.center,
              style: AppFonts.grey14w400,
            ),
          ),
          SizedBox(height: 24.h),

          Divider(height: 1.h, color: AppColors.broderColor),

          // Go to Login button
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onGoToLogin?.call();
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Center(
                  child: Text('Go to Login', style: AppFonts.brown16w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}