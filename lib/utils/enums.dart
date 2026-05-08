import 'package:flutter/material.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';


enum BaseUrl {
  production(''),
  staging('');

  final String url;

  const BaseUrl(this.url);
}



enum Endpoint {
  login('/login');

  final String value;

  const Endpoint(this.value);
}
