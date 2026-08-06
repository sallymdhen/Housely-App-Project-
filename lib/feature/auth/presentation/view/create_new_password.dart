import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/bottom_button.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/auth_app_bar.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/password_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  Future<void> _changePassword() async {
    if (passwordController.text.isEmpty || confirmController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both password fields.")),
      );
      return;
    }

    // التحقق من طول كلمة المرور
    if (passwordController.text.trim().length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be at least 8 characters."),
        ),
      );
      return;
    }

    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match.")));
      return;
    }

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('local_password', passwordController.text.trim());

      if (mounted) {
        context.push('/passwordChanged');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong.")));
    }
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
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

                SizedBox(height: 5.h),

                PasswordField(
                  controller: passwordController,
                  hintText: 'Password',
                ),

                SizedBox(height: 10.h),

                Text(
                  "Confirm Password",
                  style: AppTextStyle.authTitle.copyWith(fontSize: 14.sp),
                ),

                SizedBox(height: 5.h),

                PasswordField(
                  controller: confirmController,
                  hintText: 'Password',
                ),

                SizedBox(height: 280),

                BottomButton(
                  title: "Change Password",
                  onPressed: _changePassword,
                ),

                // SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
