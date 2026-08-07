import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/clandar_arrow_button.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat('MMMM yyyy').format(focusedDay),
          style: AppTextStyle.NearbyName.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor,
          ),
        ),

        const Spacer(),

        CalendarArrowButton(
          icon: Icons.chevron_left,
          onTap: onPrevious,
        ),

        const SizedBox(width: 10),

        CalendarArrowButton(
          icon: Icons.keyboard_arrow_right_rounded,
          onTap: onNext,
        ),
      ],
    );
  }
}