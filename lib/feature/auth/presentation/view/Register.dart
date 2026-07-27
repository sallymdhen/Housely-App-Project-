import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:go_router/go_router.dart';

import '../../data/user_model.dart';
import '../widget/custom_field.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final RegisterData _registerData = RegisterData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _registerData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register Account',
                  style: AppTextStyle.welcomeBackTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in with your email and password\nor social media to continue',
                  style: AppTextStyle.descriptionTextStyle,
                ),
                const SizedBox(height: 32),

                CustomTextFormField(
                  label: 'Email',
                  hintText: 'brooklynsim@gm | |',
                  controller: _registerData.emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Email is not correct';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextFormField(
                  label: 'Username',
                  hintText: 'Username',
                  controller: _registerData.usernameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextFormField(
                  label: 'Password',
                  hintText: 'Password',
                  controller: _registerData.passwordController,
                  isPassword: true,
                  isHidden: _registerData.isPasswordHidden,
                  onSuffixTap: () {
                    setState(() {
                      _registerData.isPasswordHidden =
                          !_registerData.isPasswordHidden;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'The password must be at least 8 characters long.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _agreeToTerms,
                        activeColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 14,
                        ),
                        children: [
                          const TextSpan(text: 'Agree with '),
                          TextSpan(
                            text: 'terms',
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'privacy',
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                CustomPrimaryButton(
                  text: 'Sign up',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (!_agreeToTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please agree to the terms and privacy policy',
                            ),
                          ),
                        );
                        return;
                      }

                      await _registerData.registerUserLocal();

                      if (!mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registration Successful!'),
                        ),
                      );

                      context.go('/login');
                    }
                  },
                ),

                const SizedBox(height: 24),

                Center(
                  child: Text(
                    'Or',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      fontFamily: AppFonts.inter,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SocialButton(iconPath: 'assets/icons/facebook.png'),
                    SizedBox(width: 16),
                    SocialButton(iconPath: 'assets/icons/google.png'),
                  ],
                ),

                const SizedBox(height: 32),

                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        const TextSpan(
                          text: "Already have an account ? ",
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/');
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}