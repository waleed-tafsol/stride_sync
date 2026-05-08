import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.secondary,
        brightness: Brightness.light,
      ),
    ).copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        minLeadingWidth: 50.r,
      ),
      splashColor: AppColors.secondary,
      highlightColor: AppColors.secondary,
      brightness: Brightness.light,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textBlack,
        titleTextStyle: TextStyle(
          color: AppColors.textBlack,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        // centerTitle: true,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 25.sp,
          color: AppColors.textBlack,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 16.sp,
          color: AppColors.textBlack,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: AppColors.textBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: TextStyle(
          fontSize: 15.sp,
          color: AppColors.textBlack,

          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 15.sp,
          color: AppColors.textBlack,

          fontWeight: FontWeight.w400,
        ),
        bodyLarge: AppFonts.brown18w400,
        bodySmall: TextStyle(
          fontSize: 13.sp,
          color: AppColors.textBlack,
          fontWeight: FontWeight.w400,
        ),
      ).apply(fontFamily: AppFonts.fontFamily),
      // Text Selection Theme for cursor color
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.textFeildBorder, // Cursor color
      ),

      iconTheme: const IconThemeData(color: Colors.black54),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        side: BorderSide.none,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        labelPadding: EdgeInsets.zero,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        checkColor: const WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondary;
          }
          return null;
        }),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
          textStyle: TextStyle(
            height: 0,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: AppColors.fillColor,
          side: const BorderSide(color: AppColors.textBlack),
          // padding: EdgeInsets.symmetric(vertical: 19.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
          textStyle: AppFonts.white15w500,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        filled: true,
        fillColor: AppColors.white,

        errorStyle: TextStyle(fontSize: 11.sp, overflow: TextOverflow.visible),
        errorMaxLines: 2,
        suffixIconColor: AppColors.textBlack,
        hintStyle: AppFonts.grey18w400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textFeildBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textFeildBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.textFeildBorder),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleColor: const Color(0xffCDCFD0),
        backgroundColor: Colors.white,
        dragHandleSize: Size(48.w, 5.h),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue[400],
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headlineLarge: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      iconTheme: const IconThemeData(color: AppColors.secondary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
