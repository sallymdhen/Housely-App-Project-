import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/feature/notification/data/model/notification_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  // ============================================================
  // ضعي هنا مسارات الصور الموجودة عندك
  // ============================================================

  // صورة أيقونة الجرس
  static const String notificationIcon =  'assets/icons/notification_icon.png';

  // صورة أيقونة الشخص
  static const String personIcon = 'assets/icons/prof_notification.png';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 40, height: 40, child: _buildLeading()),

                SizedBox(width: 15),

                Expanded(child: _buildText()),
              ],
            ),
          ),

          // الخط
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Container(height: 1.h, color: const Color(0xFFE9E9E9)),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LEADING
  // ============================================================

  Widget _buildLeading() {
    // ----------------------------------------------------------
    // صورة الشخص
    // ----------------------------------------------------------

    if (notification.isMessage && notification.image != null) {
      return ClipOval(
        child: Image.asset(
          notification.image!,
          width: 52.w,
          height: 52.w,
          fit: BoxFit.cover,
        ),
      );
    }

    // ----------------------------------------------------------
    // صورة أيقونة الجرس
    // ----------------------------------------------------------

    if (notification.showNotificationIcon) {
      return SizedBox(
        width: 68.w,
        height: 68.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              notificationIcon,
              width: 68.w,
              height: 68.w,
              fit: BoxFit.contain,
            ),
          ],
        ),
      );
    }

    // ----------------------------------------------------------
    // صورة أيقونة الشخص
    // ----------------------------------------------------------

    return Image.asset(
      personIcon,
      width: 68.w,
      height: 68.w,
      fit: BoxFit.contain,
    );
  }

  // ============================================================
  // TEXT
  // ============================================================

  Widget _buildText() {
    // ----------------------------------------------------------
    // Message
    // ----------------------------------------------------------
    if (notification.isMessage && notification.name != null) {
      return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: notification.name!,
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF171717),
                height: 1.4,
              ),
            ),

            TextSpan(
              text: ' ${notification.message}',
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

    // ----------------------------------------------------------
    // Notification عادية
    // ----------------------------------------------------------

    return Text(
      notification.message,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.greyColor,
        height: 1.4,
      ),
    );
  }
}
