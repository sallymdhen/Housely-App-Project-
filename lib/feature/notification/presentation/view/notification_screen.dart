import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/feature/notification/presentation/model/notification_model.dart';
import 'package:flutter_application_team2/feature/notification/presentation/view/empty_notification_screen.dart';
import 'package:flutter_application_team2/feature/notification/presentation/widgets/notification_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool hasNotifications = false;

  Timer? _notificationTimer;

  // TODAY

  static const List<NotificationModel> todayNotifications = [
    NotificationModel(
      message: 'Congratulations, your listing is now active. ',
      boldMessage: 'click here to see your listing',
      image: 'assets/icons/notification_icon.png',
    ),

    NotificationModel(
      message: 'Welcome, Don’t forget to complete your personal info',
      image: 'assets/icons/notification_icon.png',
    ),
  ];

  // YESTERDAY

  static const List<NotificationModel> yesterdayNotifications = [
    NotificationModel(
      name: 'Anggela and joni',
      message: 'send you message, check it now',
      image: 'assets/image/person4.png',
      isMessage: true,
      showNotificationIcon: false,
    ),

    NotificationModel(
      message: 'Welcome, Don’t forget to complete your personal info',
      showNotificationIcon: true,
      image: 'assets/icons/notification_icon.png',
    ),

    NotificationModel(
      message: 'Welcome, Don’t forget to complete your personal info',
      showNotificationIcon: false,
      image: 'assets/icons/prof_notification.png',
    ),

    NotificationModel(
      name: 'Jhon, ani & 2 other',
      message: 'send you message, check it now',
      image: 'assets/image/agent_photo.png',
      isMessage: true,
      showNotificationIcon: false,
    ),

    NotificationModel(
      message: 'Welcome, Don’t forget to complete your personal info',
      showNotificationIcon: false,
      image: 'assets/icons/prof_notification.png',
    ),
  ];

  // INIT STATE

  @override
  void initState() {
    super.initState();

    _notificationTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          hasNotifications = true;
        });
      }
    });
  }

  // DISPOSE

  @override
  void dispose() {
    _notificationTimer?.cancel();
    super.dispose();
  }

  // REFRESH

  Future<void> _refreshNotifications() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      hasNotifications = true;
    });
  }

  // BUILD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),

            SizedBox(height: 20.h),

            Expanded(
              child: RefreshIndicator(
                color: const Color(0xFF7138D4),
                backgroundColor: Colors.white,
                onRefresh: _refreshNotifications,
                child: hasNotifications
                    ? _notificationList()
                    : const EmptyNotificationScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // NOTIFICATION LIST

  Widget _notificationList() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        // TODAY
        _buildSectionTitle('Today'),
        SizedBox(height: 10.h),
        ...todayNotifications.map(
          (notification) => NotificationItem(notification: notification),
        ),

        SizedBox(height: 34.h),

        // YESTERDAY
        _buildSectionTitle('Yesterday'),
        SizedBox(height: 10.h),
        ...yesterdayNotifications.map(
          (notification) => NotificationItem(notification: notification),
        ),
      ],
    );
  }

  // APP BAR

  Widget _buildAppBar() {
    return SizedBox(
      height: 56.h,
      child: Row(
        children: [
          SizedBox(width: 20.w),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              size: 25.sp,
              color: const Color(0xFF182230),
            ),
          ),

          const Spacer(),

          Text(
            'Notification',
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF182230),
            ),
          ),

          const Spacer(),

          SizedBox(width: 46.w),
        ],
      ),
    );
  }

  // SECTION TITLE

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: AppFonts.inter,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF182230),
          ),
        ),
      ),
    );
  }
}