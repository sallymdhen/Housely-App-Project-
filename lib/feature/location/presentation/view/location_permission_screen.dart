import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/core/widgets/skip_button.dart';
import 'package:flutter_application_team2/feature/location/data/location_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  void useCurrentLocation(BuildContext context) {
    LocationData.selectedAddress = "Current location";
    context.go('/chooseLocation');
  }

  void selectManually(BuildContext context) {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),

          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h),

                Align(alignment: Alignment.topRight, child: const SkipButton()),

                SizedBox(height: 40.h),

                Image.asset(
                  "assets/image/Group 2.png",
                  width: 300.w,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 45.h),

                Text(
                  "Hi, Nice to meet you !",
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 16.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Choose your location to find property around you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF9DA4AE),
                      height: 1.5,
                    ),
                  ),
                ),

                SizedBox(height: 140.h),

                BottomButton(
                  title: "Use current location",
                  shadowColor: AppColor.primaryColor.withValues(alpha: 0.12),
                  shadowBlurRadius: 16,
                  shadowSpreadRadius: 6,
                  onPressed: () {
                    useCurrentLocation(context);
                  },
                ),

                SizedBox(height: 16.h),

                BottomButton(
                  title: "Select it manually",
                  shadowColor: AppColor.primaryColor.withValues(alpha: 0.12),
                  shadowBlurRadius: 16,
                  shadowSpreadRadius: 6,
                  backgroundColor: Colors.white,
                  textColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                  onPressed: () {
                    selectManually(context);
                  },
                ),

                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
