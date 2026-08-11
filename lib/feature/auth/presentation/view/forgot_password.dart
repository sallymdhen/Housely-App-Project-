import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/app_color.dart';
import '../widget/auth_app_bar.dart';
import '../widget/contact_card.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int selectedIndex = -1;
  String userEmail = '';

  void _continue() {
    if (selectedIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a contact method first.")),
      );
      return;
    }
    context.push('/verifyEmail');
    // Navigator.pushNamed(context, AppRoutes.verifyEmail);
  }

  @override
  void initState() {
    super.initState();
    loadUserEmail();
  }

  Future<void> loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userEmail = prefs.getString('user_email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthAppBar(),

                      SizedBox(height: 15.h),

                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Text(
                        "Select which contact details should we use to reset your password",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),

                      SizedBox(height: 27.h),

                      ContactCard(
                        icon: 'assets/icons/Call.png',
                        title: "Via phone",
                        value: "+62 85 -5***488-65",
                        selected: selectedIndex == 0,
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                      ),

                      SizedBox(height: 15.h),

                      ContactCard(
                        icon: 'assets/icons/Message.png',
                        title: "Via email",
                        value: userEmail,
                        selected: selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                      ),

                      SizedBox(height: 200),

                      BottomButton(title: "Continue", onPressed: _continue),

                      SizedBox(height: 48),
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
