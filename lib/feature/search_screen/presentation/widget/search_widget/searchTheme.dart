import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';

class AppRadius {
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double pill = 12;
  static const double sheet = 28;
}

class AppTextStyles {
  static TextStyle screenTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle sectionTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColor.textPrimary,
  );

  static TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.textSecondary,
  );
}
