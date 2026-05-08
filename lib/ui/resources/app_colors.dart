import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF061B0E);
  static const primaryLight = Color(0xFFFCF0FC);
  static const textGrey = Color(0xFF5C5C5C);
  static const textBlack = Color(0xFF323232);
  static const broderColor = Color(0xFFC3C8C1);
  static const secondary = Color(0xFF78583B);
  static const lightbrown = Color(0xFFE1B691);
  static const textFeildBorder = Color(0xFF432C23);
  static const scaffoldBackground = Color(0xFFFBF9F8);
  static const white = Colors.white;
  static const black = Color(0xFF061B0E);
  static const fillColor = Color(0xFFFBF9F8);
  static const buttonBorder = Color(0xFFFFDCC0);

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
