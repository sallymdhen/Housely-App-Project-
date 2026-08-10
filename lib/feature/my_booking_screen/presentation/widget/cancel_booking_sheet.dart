import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';

class CancelBookingSheet extends StatelessWidget {
  const CancelBookingSheet({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Icon(
              Icons.warning_amber_rounded,
              color:AppColor.redColor,
              size: 60,
            ),

            const SizedBox(height: 20),

            Text(
              'Cancel Booking',
              style: AppTextStyle.authTitle,
            ),

            const SizedBox(height: 12),

            Text(
              'Are you sure you want to cancel this booking?',
              textAlign: TextAlign.center,
              style: AppTextStyle.NearbyLoc,
            ),

            const SizedBox(height: 28),
            Row(
  children: [
    Expanded(
      child: PrimaryBottom(
        onPressed: () {
          Navigator.pop(context, false);
        },
        name: "edit data ",
        width: double.infinity,
      ),
    ),

    const SizedBox(width: 12),

    Expanded(
      child: PrimaryBottom(
        name: "Yes",
        width: double.infinity,
        onPressed: onConfirm,
      ),
    ),
  ],
),

          /*  Row(
              children: [

                Expanded(
                  child: PrimaryBottom(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    name: "No",
                     width: double.infinity,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: PrimaryBottom(
                    name: "Yes",
                    width: double.infinity,
                    onPressed: onConfirm,
                  ),
                ),
              ],
            ),*/

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}