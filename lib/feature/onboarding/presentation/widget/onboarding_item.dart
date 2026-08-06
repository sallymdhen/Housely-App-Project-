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

    if (boldWords.isEmpty) {
      return Text(
        title,

        textAlign: TextAlign.center,

        style: AppTextStyle.authTitle.copyWith(
          fontSize: 24.sp,

          height: 1.25,

          color: Colors.black87,

          fontWeight: FontWeight.w400,

          fontFamily: AppFonts.inter,
        ),
      );
    }

    String targetWord = boldWords.first;

    int index = title.indexOf(targetWord);

    String firstPart = title.substring(0, index);

    String boldPart = title.substring(index, index + targetWord.length);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        SizedBox(height: 15),

        SizedBox(
          height: 280,

          child: Stack(
            alignment: Alignment.center,

            clipBehavior: Clip.none,

            children: [
              // الصورة الخلفية (السفلية)
              Transform.translate(
                offset: model.isBackgroundRight
                    ? const Offset(40, 10)
                    : const Offset(-40, 10),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),

                  child: Image.asset(
                    model.backgroundImage,

                    width: 145,

                    height: 220,

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // الصورة الأمامية (العلوية)
              Transform.translate(
                offset: model.isBackgroundRight
                    ? const Offset(-40, -20)
                    : const Offset(40, -20),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),

                  child: Image.asset(
                    model.foregroundImage,

                    width: 145,

                    height: 285,

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 30),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: _buildFormattedTitle(model.title),
        ),

        SizedBox(height: 20),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Text(
            model.description,

            textAlign: TextAlign.center,

            style: AppTextStyle.authSubTitle.copyWith(
              fontSize: 12,

              height: 1.5,

              color: AppColor.greyColor,
            ),
          ),
        ),

        //  SizedBox(height: 10),
      ],
    );
  }
}
