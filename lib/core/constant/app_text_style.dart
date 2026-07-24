import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';

class AppTextStyle {
  static final TextStyle namePlaceCard = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColor.whiteColor,
  );

  /// Main Titles
  static final TextStyle authTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  /// Description
  static final TextStyle authSubTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    color: AppColor.greyColor,
  );

  /// Button Text
  static final TextStyle buttonText = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColor.whiteColor,
  );

  /// TextField Hint
  static final TextStyle hintText = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    color: AppColor.greyColor,
  );

  /// Success Title
  static final TextStyle successTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  /// Success Description
  static final TextStyle successDescription = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    color: AppColor.greyColor,
  );

  /// OTP Number
  static final TextStyle otpText = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 22,
    fontWeight: FontWeight.w300,
  );
}
