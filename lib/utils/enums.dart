import 'dart:ui';

import 'package:stride_sync/ui/resources/app_colors.dart';

enum BaseUrl {
  production(''),
  staging('');

  final String url;

  const BaseUrl(this.url);
}

enum AppointmentType {
  health,
  training,
  event;

  String get label {
    switch (this) {
      case AppointmentType.health:
        return 'Health';
      case AppointmentType.training:
        return 'Training';
      case AppointmentType.event:
        return 'Event';
    }
  }

  Color get textColor {
    switch (this) {
      case AppointmentType.health:
        return AppColors.greenColor;

      case AppointmentType.training:
        return AppColors.secondary;

      case AppointmentType.event:
        return AppColors.greycolor2;
    }
  }

  Color get backGroundColor {
    switch (this) {
      case AppointmentType.health:
        return AppColors.lightGreen;

      case AppointmentType.training:
        return AppColors.lightBrown2;

      case AppointmentType.event:
        return AppColors.fillGreyColor;
    }
  }
}

enum Status {
  active,
  inActive;

  String get label {
    switch (this) {
      case Status.active:
        return 'Active';
      case Status.inActive:
        return 'Inactive';
    }
  }

  Color get textColor {
    switch (this) {
      case Status.active:
        return AppColors.greenColor;

      case Status.inActive:
        return AppColors.secondary;
    }
  }

  Color get backGroundColor {
    switch (this) {
      case Status.active:
        return AppColors.lightGreen;

      case Status.inActive:
        return AppColors.lightBrown2;
    }
  }
}

enum Endpoint {
  login('/login');

  final String value;

  const Endpoint(this.value);
}
