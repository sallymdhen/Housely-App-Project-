import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/feature/notification/presentation/model/notification_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON / IMAGE
          if (notification.image != null)
            ClipOval(
              child: Image.asset(
                notification.image!,
                width: 36.w,
                height: 36.w,
                fit: BoxFit.cover,
              ),
            )
          else
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF2F4F7),
              ),
              child: Icon(
                notification.showNotificationIcon
                    ? Icons.notifications_none_outlined
                    : Icons.person_outline,
                size: 18.sp,
                color: const Color(0xFF182230),
              ),
            ),

          SizedBox(width: 12.w),

          // TEXT + DIVIDER
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (notification.name != null)
                  _buildNameAndMessage()
                else
                  _buildMessage(),

                SizedBox(height: 10.h),

                // الخط
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xFFE4E7EC),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // NAME + MESSAGE

  Widget _buildNameAndMessage() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${notification.name} ',
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF182230),
            ),
          ),
          TextSpan(
            text: notification.message,
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.greyColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // MESSAGE

  Widget _buildMessage() {
    // إذا لم يوجد نص Bold
    if (notification.boldMessage == null) {
      return Text(
        notification.message,
        style: TextStyle(
          fontFamily: AppFonts.inter,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.greyColor,
          height: 1.4,
        ),
      );
    }

    // النص مقسوم إلى قسم عادي + قسم Bold
    final normalText = notification.message.replaceFirst(
      notification.boldMessage!,
      '',
    );

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: AppFonts.inter,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.greyColor,
          height: 1.4,
        ),
        children: [
          TextSpan(text: normalText),
          TextSpan(
            text: notification.boldMessage,
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF182230),
            ),
          ),
        ],
      ),
    );
  }
}
