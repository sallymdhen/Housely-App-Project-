import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:readmore/readmore.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,

      trimMode: TrimMode.Line,
      trimLines: 3,

      trimCollapsedText: ' Read more',
      trimExpandedText: ' Read less',

      style: AppTextStyle.NearbyLoc.copyWith(
        fontSize: 12,
        height: 1.5,
      ),

      moreStyle: AppTextStyle.NearbyLoc.copyWith(
        fontSize: 12,
        color: AppColor.primaryColor,
        fontWeight: FontWeight.w500,
      ),

      lessStyle: AppTextStyle.NearbyLoc.copyWith(
        fontSize: 12,
        color: AppColor.primaryColor,
        fontWeight: FontWeight.w500,
      ),

      delimiter: '...',
    );
  }
}