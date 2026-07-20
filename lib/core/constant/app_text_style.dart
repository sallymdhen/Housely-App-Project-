import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';

class AppTextStyle {
  static final TextStyle namePlaceCard = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColor.whiteColor,
  );

  static final TextStyle welcomeBackTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    color: AppColor.blackColor,
  );
  static final TextStyle descriptionTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
  );
  static final TextStyle labelTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    color: AppColor.blackColor,
  );
  static final TextStyle buttonTextStyle = TextStyle(
    color: AppColor.whiteColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.inter,
  );
}
