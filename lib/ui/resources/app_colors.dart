import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF061B0E);
  static const primaryLight = Color(0xFFFCF0FC);
  static const textGrey = Color(0xFF5C5C5C);
  static const textBlack = Color(0xFF323232);
  static const greyColor = Color(0xFFE4E2DD);
  static const fillGreyColor = Color(0xFFE1E1E1);
  static const greycolor2 = Color(0xFF676767);
  static const borderColor = Color(0xFFC3C8C1);
  static const secondary = Color(0xFF78583B);
  static const lightBrown1 = Color(0xFFE1B691);
  static const lightBrown2 = Color(0xFFF5E9DE);
  static const textFeildBorder = Color(0xFF432C23);
  static const scaffoldBackground = Color(0xFFFBF9F8);
  static const white = Colors.white;
  static const black = Color(0xFF061B0E);
  static const fillColor = Color(0xFFFBF9F8);
  static const buttonBorder = Color(0xFFFFDCC0);
  static const dialogBorder = Color(0xFFAAAAAA);
  static const lightBrown = Color(0xFFFFF7F3);
  static const greenColor = Color(0xFF07591B);
  static const lightGreen = Color(0xFFF3FFED);
  

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,

    colors: [secondary, textFeildBorder],
  );
  static const LinearGradient greyToLightBrown = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    stops: [0, 0.39, 0.67, 1.0],

    colors: [
      Color(0xFFDCB795),
      Color(0xFFF0E0BF),
      Color(0xFFEAEAEA),
      Color(0xFFDDDDDD),
    ],
  );
}
