import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingEmpty extends StatelessWidget {
  const BookingEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Image.asset(
          'assets/image/opps_no_booking.png',
          width: 275,
          height: 225,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 30),
        Text(
          'You have no upcoming booking',
          style: AppTextStyle.welcomeBackTextStyle,
        ),
        SizedBox(height: 16),

        RichText(
          text: TextSpan(
            style: AppTextStyle.descriptionTextStyle,
            children: [
              const TextSpan(text: 'Are you looking for a ', ),
              TextSpan(
                text: 'completed',
                style:AppTextStyle.descriptionTextStyle.copyWith(color: AppColor.primaryColor),
              ),
              const TextSpan(text: ' or '),
              TextSpan(
                text: 'cancelled',
                style: AppTextStyle.descriptionTextStyle.copyWith(color: AppColor.primaryColor),
              ),
              const TextSpan(text: ' Booking?'),
            ],
          ),
        ),

        
      ],
    );
  }
}
