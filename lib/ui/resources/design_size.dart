import 'dart:developer';

import 'package:flutter/cupertino.dart';

enum DeviceType { foldOuter, mobile, tablet, desktop }

Size getDesignSize(BuildContext context, BoxConstraints constraints) {
  final double width = constraints.maxWidth;
  final bool isLandscape =
      MediaQuery.orientationOf(context) == Orientation.landscape;
  // Determine device type based on screen width
  DeviceType deviceType;
  if (width < 500) {
    deviceType = DeviceType.foldOuter;
  } else if (width < 600) {
    deviceType = DeviceType.mobile;
  } else if (width < 1024) {
    deviceType = DeviceType.tablet;
  } else {
    deviceType = DeviceType.desktop;
  }
  log('DEVICE: ${deviceType.name}');
  switch (deviceType) {
    case DeviceType.foldOuter:
      return isLandscape ? const Size(932, 430) : const Size(430, 932);
    case DeviceType.mobile:
      return isLandscape ? const Size(932, 430) : const Size(430, 932);
    case DeviceType.tablet:
      return isLandscape ? const Size(1024, 768) : const Size(768, 1024);
    case DeviceType.desktop:
      return isLandscape ? const Size(1440, 800) : const Size(800, 1440);
  }
}
