import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h, right: 8.w),
                  child: OutlinedButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(20.w, 25.h),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ),
                ),
              ),

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
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 18.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Choose your location to find property around you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),

              SizedBox(height: 80.h),

              BottomButton(
                title: "Use current location",
                onPressed: () {
                  context.go('/chooseLocation');
                },
              ),

              SizedBox(height: 18.h),
              BottomButton(
                title: "Select it manually",
                onPressed: () {},
                backgroundColor: Colors.white,
                textColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),

              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
