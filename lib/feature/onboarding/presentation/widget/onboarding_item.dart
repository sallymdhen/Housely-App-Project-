import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/onboarding/model/onboarding_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  Widget _buildFormattedTitle(String title) {
    List<String> boldWords = [];
    if (title.contains('perfect place')) {
      boldWords = ['perfect place'];
    } else if (title.contains('one click')) {
      boldWords = ['one click'];
    } else if (title.contains('dream home')) {
      boldWords = ['dream home'];
    }

    String targetWord = boldWords.first;
    int index = title.indexOf(targetWord);

    String firstPart = title.substring(0, index);
    String boldPart = targetWord;
    String lastPart = title.substring(index + targetWord.length);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyle.authTitle.copyWith(
          fontSize: 24.sp,
          height: 1.25,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.inter,
        ),
        children: [
          TextSpan(text: firstPart),
          TextSpan(
            text: boldPart,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          TextSpan(text: lastPart),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              SizedBox(
                height: 280.h,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: model.isBackgroundRight ? 40.w : null,
                      left: model.isBackgroundRight ? null : 40.w,
                      bottom: 12.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),

                        child: Image.asset(
                          model.backgroundImage,
                          width: 150.w,
                          height: 210.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //),
                    Positioned(
                      right: model.isBackgroundRight ? null : 40.w,
                      left: model.isBackgroundRight ? 40.w : null,
                      top: -20.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(
                          model.foregroundImage,
                          width: 150.w,
                          height: 275.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: _buildFormattedTitle(model.title),
              ),

              SizedBox(height: 16.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.authSubTitle.copyWith(
                    fontSize: 13.sp,
                    height: 1.5,
                    color: AppColor.greyColor,
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}
