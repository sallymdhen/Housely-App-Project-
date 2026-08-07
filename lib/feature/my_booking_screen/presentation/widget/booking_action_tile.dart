import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
//هاد السطر بالترويسة يلي عم ينقلني بين الصفحات 
class BookingActionTile extends StatelessWidget {
  const BookingActionTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
         // horizontal: 24,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: AppTextStyle.Nearby.copyWith(
                 color: AppColor.greyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

           
          ],
        ),
      ),
    );
  }
}