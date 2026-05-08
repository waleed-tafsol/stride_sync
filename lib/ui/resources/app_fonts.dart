import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract final class AppFonts {
  static const String fontFamily = 'Manrope';

  static const TextStyle _base = TextStyle(fontFamily: fontFamily, height: 0);

  static final black14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
  );
  static final black32w700 = _base.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
  );
  static final white15w500 = _base.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
   static final white16w500 = _base.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final white18w400 = _base.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static final grey18w400 = _base.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
  );
  static final grey16w400 = _base.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );
  static final SplashTexT35w700 = _base.copyWith(
    fontSize: 35.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textFeildBorder,
  );
  static final brown14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );
  static final brown18w400 = _base.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );
}
