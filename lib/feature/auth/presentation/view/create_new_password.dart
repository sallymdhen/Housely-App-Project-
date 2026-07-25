import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/route/app_router.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/auth_app_bar.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/password_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void _changePassword() {
    if (passwordController.text.isEmpty || confirmController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both password fields.")),
      );
      return;
    }

    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match.")));
      return;
    }
    context.go('/passwordChanged');
    
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const AuthAppBar(),

              SizedBox(height: 15.h),

              Text(
                "Create New Password",
                style: AppTextStyle.authTitle.copyWith(fontSize: 20.sp),
              ),

              SizedBox(height: 10.h),

              Text(
                "Please enter a new password\n to change",
                style: TextStyle(color: AppColor.greyColor, fontSize: 14.sp),
              ),

              SizedBox(height: 30.h),
              Text(
                "New Password",
                style: AppTextStyle.authTitle.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 5),
              PasswordField(
                controller: passwordController,
                hintText: 'Password',
              ),

              SizedBox(height: 10.h),
              Text(
                "Confirm Password",
                style: AppTextStyle.authTitle.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 5),
              PasswordField(
                controller: confirmController,
                hintText: 'Password',
              ),

              const Spacer(),

              BottomButton(
                title: "Change Password",
                onPressed: _changePassword,
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
