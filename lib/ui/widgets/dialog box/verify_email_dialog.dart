import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

Future<void> showVerifyEmailDialog(
  BuildContext context, {
  required String email,
  VoidCallback? onVerify,
  VoidCallback? onResend,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black38,
    barrierDismissible: false,
    builder: (_) =>
        VerifyEmailDialog(email: email, onVerify: onVerify, onResend: onResend),
  );
}

class VerifyEmailDialog extends StatefulWidget {
  const VerifyEmailDialog({
    super.key,
    required this.email,
    this.onVerify,
    this.onResend,
  });

  final String email;
  final VoidCallback? onVerify;
  final VoidCallback? onResend;

  @override
  State<VerifyEmailDialog> createState() => _VerifyEmailDialogState();
}

class _VerifyEmailDialogState extends State<VerifyEmailDialog> {
  late final ValueNotifier<int> _remainingSeconds;

  late final ValueNotifier<bool> _canResend;

  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _remainingSeconds = ValueNotifier(0);
    _canResend = ValueNotifier(true);
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();

    _remainingSeconds.value = 120;
    _canResend.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds.value <= 1) {
        timer.cancel();
        _remainingSeconds.value = 0;
        _canResend.value = true;
      } else {
        _remainingSeconds.value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 10,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(7.5.w),
                  decoration: BoxDecoration(
                    border: .all(color: AppColors.borderColor),
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    TablerIcons.x,
                    size: 15.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(TablerIcons.mail, color: Colors.white, size: 36.sp),
            ),
            SizedBox(height: 24.h),

            Text('Verify Email', style: AppFonts.black18w700),
            SizedBox(height: 10.h),

            Text(
              'We sent a code to ${widget.email}',
              textAlign: TextAlign.center,
              style: AppFonts.grey14w500,
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.w),
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.center,
                separatorBuilder: (index) => SizedBox(width: 10.w),
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  textStyle: AppFonts.grey14w400,
                ),
                focusedPinTheme: PinTheme(
                  width: 32.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  textStyle: AppFonts.black14w400,
                ),
                submittedPinTheme: PinTheme(
                  width: 32.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  textStyle: AppFonts.black14w400,
                ),
                onChanged: (pin) {},
                onCompleted: (pin) {},
              ),
            ),

            SizedBox(height: 20.h),

            ValueListenableBuilder<bool>(
              valueListenable: _canResend,
              builder: (_, canResend, _) {
                return GestureDetector(
                  onTap: () {
                    if (canResend) {}
                  },
                  child: ValueListenableBuilder<int>(
                    valueListenable: _remainingSeconds,
                    builder: (_, seconds, _) {
                      return Text(
                        canResend
                            ? 'Resend code'
                            : 'Resend in ${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}',
                        style: AppFonts.brown14w500,
                      );
                    },
                  ),
                );
              },
            ),

            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31.w),
              child: GradientButton(
                text: 'Verify',
                onPressed: widget.onVerify ?? () {},
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
