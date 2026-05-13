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
  career;

  String get label {
    switch (this) {
      case AppointmentType.health:
        return 'HEALTH';
      case AppointmentType.training:
        return 'TRAINING';
      case AppointmentType.career:
        return 'CAREER';
    }
  }

  Color get textColor {
    switch (this) {
      case AppointmentType.health:
        return AppColors.greenColor;

      case AppointmentType.training:
        return AppColors.secondary;

      case AppointmentType.career:
        return AppColors.secondary;
    }
  }

  Color get backGroundColor {
    switch (this) {
      case AppointmentType.health:
        return AppColors.lightGreen;

      case AppointmentType.training:
        return AppColors.lightBrown2;

      case AppointmentType.career:
        return AppColors.lightBrown2;
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
