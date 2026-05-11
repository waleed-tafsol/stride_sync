import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final IconData? icon;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50.r),
        child: Ink(
          height: 56.h,
          width: double.infinity,

          padding: EdgeInsets.symmetric(vertical: 10.h),

          decoration: BoxDecoration(
            gradient: AppColors.buttonGradient,
            borderRadius: BorderRadius.circular(50.r),
            border: .all(color: AppColors.buttonBorder),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: .center,
              children: [
                if (icon != null)
                  Icon(icon, size: 15.sp, color: AppColors.white),
              
                if (icon != null) SizedBox(width: 10.w),
                Text(text, style: textStyle ?? AppFonts.white16w500),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
