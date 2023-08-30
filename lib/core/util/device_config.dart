import 'dart:developer';

import 'package:flutter/material.dart';

class DeviceConfig {
  static void init(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    try {
      deviceWidth = mediaQueryData.size.width;
      deviceHeight = mediaQueryData.size.height;
      deviceSafeHeight =
          mediaQueryData.size.height - mediaQueryData.padding.vertical;
      deviceSafeHeightTrimmed = deviceSafeHeight - kToolbarHeight;
    } catch (e) {
      log('DeviceConfig: deviceWidth or deviceHeight already initialized');
    }
  }

  static late final double deviceWidth;
  static late final double deviceHeight;
  static late final double deviceSafeHeight;
  static late final double deviceSafeHeightTrimmed;
  static const double breakPoint = 500.0;
  static bool get breakPointBreached => deviceWidth < breakPoint;
}
