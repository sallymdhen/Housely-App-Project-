import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/booking_calendar.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/custom_divider.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/shar_and_shat_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateTime? selectedStart;
  DateTime? selectedEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 16,),
            Container(
              width: 42.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColor.lightgrey,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(height: 16),

            Text(
              'Select Date',
              style: AppTextStyle.authTitle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                ActionIcon(img: 'assets/icons/Calendar.png'),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calendar',
                      style: AppTextStyle.NearbyName.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Set time on your calendar',
                      style: AppTextStyle.NearbyLoc.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            const CustomDivider(),

            const SizedBox(height: 24),

            BookingCalendar(
              onDateSelected: (start, end) {
                setState(() {
                  selectedStart = start;
                  selectedEnd = end;
                });
              },
            ),

            const Spacer(),

            PrimaryBottom(
              name: 'Save',
              width: double.infinity,
              onPressed: () {
                if (selectedStart != null && selectedEnd != null) {
                  Navigator.pop(context, {
                    'start': selectedStart,
                    'end': selectedEnd,
                  });
                }
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
