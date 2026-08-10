import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsFeatureOfEstate extends StatelessWidget {
  const DetailsFeatureOfEstate({
    super.key,
    required this.title,
    required this.valueOfTitle,
    this.member,
  });
  final String title;
  final Widget? member;
  //final String img;
  final String valueOfTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.searchProperty.copyWith(fontSize: 12)),
        SizedBox(height: 4),
        Row(
          children: [
            ?member,
            SizedBox(width: 2.w),

            //Image.asset(img,width:16.w ,height:16.w ,),
            Text(
              valueOfTitle,
              style: AppTextStyle.locationName.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
