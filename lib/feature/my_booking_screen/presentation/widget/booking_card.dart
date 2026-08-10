import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_status_type.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/booking_status_badge.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/presentation/widget/cancel_booking_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.booking, this.onBookingCancelled,
  });

  final BookingModel booking;
  final VoidCallback? onBookingCancelled;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
  if (booking.status == BookingStatusType.waitingPayment) {
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CancelBookingSheet(
        onConfirm: () {
          // YES
          booking.status = BookingStatusType.cancelled;

          Navigator.pop(context, true);

          onBookingCancelled?.call();
        },
      ),
    );

    // NO
    if (result == false) {
      context.go(
        '/reserve',
        extra: booking.estate,
      );
    }
  }
},
     /*onTap: () {
  if (booking.status == BookingStatusType.waitingPayment) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CancelBookingSheet(
        onConfirm: () {
          booking.status = BookingStatusType.cancelled;
          Navigator.pop(context);
          onBookingCancelled?.call();
        },
      ),
    );
  }
},*/
      child: Container(
       // margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
         // borderRadius: BorderRadius.circular(16),
          //border: Border.all(color: AppColor.lightgrey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                booking.estate.image!,
                width: 82,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
      
            const SizedBox(width: 12),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  Text(
                    booking.estate.name!,
                    style: AppTextStyle.NearbyName.copyWith(
              
                      fontWeight: FontWeight.w700,
                    ),
                  ),
      
                  const SizedBox(height: 3),
      
                  Row(
                    children: [
      
                      Image.asset('assets/icons/Location.png',width:16 ,height:16 ,),
                      SizedBox(width: 3,),
      
                      Expanded(
                        child: Text(
                          booking.estate.location!,
                          style: AppTextStyle.NearbyLoc.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 8),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
      
                      Text(
                        "${DateFormat('dd MMM').format(booking.checkInDate)} - ${DateFormat('dd MMM').format(booking.checkOutDate)}",
                        style: AppTextStyle.NearbyLoc.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
      
                     BookingStatusBadge(status: booking.status,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}