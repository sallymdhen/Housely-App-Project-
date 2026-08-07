import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/custom_divider.dart';

class CalendarWeekDays extends StatelessWidget {
  const CalendarWeekDays({super.key});

  @override
  Widget build(BuildContext context) {
    const days = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start,
     
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            days.length,
            (index) => Expanded(
              child: Center(
                child: Text(
                  days[index],
                  style: AppTextStyle.NearbyLoc.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        const CustomDivider(),

        const SizedBox(height: 16),
      ],
    );
  }
}