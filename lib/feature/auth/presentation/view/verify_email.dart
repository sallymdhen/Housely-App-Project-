import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/auth_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_color.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final Function(String)? onChanged;

  const OtpBox({
    super.key,
    required this.controller,
    this.autoFocus = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 60.h,
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (onChanged != null) {
            onChanged!(value);
          }
        },
      ),
    );
  }
}

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();
  final c4 = TextEditingController();
  bool isTyping = false;

  void _checkTyping(String value) {
    bool hasValue =
        c1.text.isNotEmpty ||
        c2.text.isNotEmpty ||
        c3.text.isNotEmpty ||
        c4.text.isNotEmpty;

    if (isTyping != hasValue) {
      setState(() {
        isTyping = hasValue;
      });
    }
  }

  void _verifyCode() {
    if (c1.text.isEmpty ||
        c2.text.isEmpty ||
        c3.text.isEmpty ||
        c4.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the complete verification code."),
        ),
      );
      return;
    }

    context.push('/createNewPassword');
  }

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    super.dispose();
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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthAppBar(),

                    SizedBox(height: 10.h),

                    Text(
                      "Verify your Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      "Please enter 4 digit verification that have been sent to your email address",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),

                    AnimatedPadding(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.only(top: isTyping ? 40.h : 150.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OtpBox(
                            controller: c1,
                            autoFocus: true,
                            onChanged: _checkTyping,
                          ),
                          OtpBox(controller: c2, onChanged: _checkTyping),
                          OtpBox(controller: c3, onChanged: _checkTyping),
                          OtpBox(controller: c4, onChanged: _checkTyping),
                        ],
                      ),
                    ),

                    SizedBox(height: 35.h),

                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Don't receive code ?",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Resend code",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 160),

                    BottomButton(title: "Verify", onPressed: _verifyCode),

                    //  SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
