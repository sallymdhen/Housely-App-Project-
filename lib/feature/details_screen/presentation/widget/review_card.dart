import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/details_screen/data/review_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268.w,
      height: 104.h,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFD2D6DB), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              review.image,
              width: 40.w,
              height: 40.w,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.NearbyName,
                      ),
                    ),

                    SizedBox(width: 4.w),

                    ...List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Icon(
                          Icons.star,
                          size: 14.sp,
                          color: index < review.rating
                              ? Colors.amber
                              : Colors.amber.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                Text(
                  review.review,
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.5,
                    color: const Color(0xFF9DA4AE),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
