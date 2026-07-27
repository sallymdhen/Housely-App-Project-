import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static final TextStyle namePlaceCard = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColor.whiteColor,
  );

  static final TextStyle location = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColor.greyColor,
  );

  static final TextStyle locationName = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColor.blackColor,
  );

  static final TextStyle searchProperty = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColor.greyColor,
  );

  static final TextStyle priceEstate = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: AppColor.primaryColor,
  );

  static final TextStyle nameEstate = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColor.whiteColor,
  );

  static final TextStyle Nearby = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColor.primaryColor,
  );

  static final TextStyle NearbyName = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColor.blackColor,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle NearbyLoc = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppColor.greyColor,
  );

  static final TextStyle NearbyPrice = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 10,
    color: AppColor.blackColor,
  );

  static final TextStyle NearbyRouting = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    color: AppColor.blackColor,
  );

  static final TextStyle primaryButton = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    fontSize: 18,
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

  // ==========================
  // Seham Styles
  // ==========================

  static final TextStyle authTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final TextStyle authSubTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    color: AppColor.greyColor,
  );

  static final TextStyle buttonText = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColor.whiteColor,
  );

  static final TextStyle hintText = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    color: AppColor.greyColor,
  );

  static final TextStyle successTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle successDescription = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 16,
    color: AppColor.greyColor,
  );

  static final TextStyle otpText = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: 22,
    fontWeight: FontWeight.w300,
  );
}