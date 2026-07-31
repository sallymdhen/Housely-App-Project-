import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 30.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 80.h),

                      SizedBox(
                        width: 220.w,
                        height: 220.w,
                        child: Image.asset(
                          "assets/icons/Illustration.png",
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: 25.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            Text(
                              "Success!",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 15.h),

                            Text(
                              "You password has been changed. Please log in again with a new password.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.greyColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer
                      const Spacer(flex: 1),
                      BottomButton(
                        title: "Continue",
                        onPressed: () {
                          context.go('/login');
                        },
                      ),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
