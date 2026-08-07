//هون صممت ال كونتينر يلي عم يحدد نوع الحجز سزاء أكان مكتمل او ملغي 
import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_status_type.dart';

class BookingStatusBadge extends StatelessWidget {
  const BookingStatusBadge({
    super.key,
    required this.status,
  });

  final BookingStatusType status;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String title;

    switch (status) {
      case BookingStatusType.waitingPayment:
        backgroundColor = AppColor.lightred;
        textColor = AppColor.redColor;
        title = "Waiting Payment";
        break;

      case BookingStatusType.checkIn:
        backgroundColor = AppColor.lightGreen;
        textColor = AppColor.greenColor;
        title = "Check In";
        break;

      case BookingStatusType.completed:
        backgroundColor = AppColor.lightGreen;
        textColor = AppColor.greenColor;
        title = "Completed";
        break;

      case BookingStatusType.cancelled:
         backgroundColor = AppColor.lightred;
        textColor = AppColor.redColor;
        title = "Cancelled";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
       vertical: 2
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: double.infinity,
        ),
      child: Text(
        title,
        style: AppTextStyle.NearbyLoc.copyWith(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}