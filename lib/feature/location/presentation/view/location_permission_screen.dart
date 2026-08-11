import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/route/app_router.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
  onPressed: () {
    context.go('/home');
  },
  style: OutlinedButton.styleFrom(
    fixedSize: Size(57.w, 32.h),
    padding: EdgeInsets.zero,
    side: BorderSide(color: Colors.grey.shade300),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.r),
    ),
  ),
  child: Text(
    "Skip",
    style: TextStyle(
      color: AppColor.blackColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
),
                ),
            
                SizedBox(height: 40),
            
                Image.asset(
                  "assets/image/Group 2.png",
                width: 300.w,
                 // height: 165.h,
                  fit: BoxFit.contain,
                ),
            
                SizedBox(height: 45),
            
                Text(
                  "Hi, Nice to meet you !",
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
            
                SizedBox(height: 16),
            
                /// Subtitle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Choose your location to find property around you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color(0xFF9DA4AE),
                      height: 1.5,
                    ),
                  ),
                ),
            
                 SizedBox(height:100),
            
                BottomButton(
                  title: 'Use current location',
                  
                    onPressed: () {
                    context.go( '/chooseLocation');
                   
                  },
                ),
                 
            
                SizedBox(height: 16),
            
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
      ),
    );
  }
}
