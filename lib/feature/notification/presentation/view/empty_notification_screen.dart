import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),

      children: [
        SizedBox(height: 80.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),

          child: Column(
            children: [
              Image.asset(
                'assets/image/Ilustration mailbox.png',
                width: 260.w,
                height: 290.h,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 20.h),

              Text(
                'No notification yet',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontFamily: AppFonts.inter,

                  fontSize: 20.sp,

                  fontWeight: FontWeight.w600,

                  color: const Color(0xFF182230),
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                'All notification we send will appear here, so you can view them easily anytime.',

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontFamily: AppFonts.inter,

                  fontSize: 13.sp,

                  fontWeight: FontWeight.w400,

                  color: const Color(0xFF9DA4AE),

                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
