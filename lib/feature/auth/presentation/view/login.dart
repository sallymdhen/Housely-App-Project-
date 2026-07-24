import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/feature/auth/presentation/view/Register.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_text_style.dart';
import '../../../../core/route/app_router.dart';
import '../../data/user_model.dart';
import '../widget/custom_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _loginData.dispose();
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
                SizedBox(height: 48),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 24),
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: const Icon(Icons.arrow_back, color: Colors.black),
                //   ),
                // ),
                Text(
                  'Welcome Back !',
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
                  controller: _loginData.emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Email is not correct';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CustomTextFormField(
                  label: 'Password',
                  hintText: '••••••••',
                  controller: _loginData.passwordController,
                  isPassword: true,
                  isHidden: _loginData.isPasswordHidden,
                  onSuffixTap: () {
                    setState(() {
                      _loginData.isPasswordHidden =
                          !_loginData.isPasswordHidden;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          child: Checkbox(
                            value: _loginData.rememberMe,
                            activeColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _loginData.rememberMe = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 9.333),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        print("انتقال الى واجهة سهام (chang password)");
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                CustomPrimaryButton(
                  text: 'Sign in',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isUserValid = await _loginData.loginUserLocal();

                      if (isUserValid) {
                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login successful!')),
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.profile,
                        );
                      } else {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Account not found or password required!',
                            ),
                          ),
                        );
                      }
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
                  children: [
                    const SocialButton(iconPath: 'assets/icons/facebook.png'),
                    const SizedBox(width: 16),
                    const SocialButton(iconPath: 'assets/icons/google.png'),
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
                        const TextSpan(text: "Don’t have account ? "),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register_Screen(),
                                ),
                              );
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
