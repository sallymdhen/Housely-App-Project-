import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_fonts.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/feature/auth/data/user_model.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/custom_field.dart';
import 'package:go_router/go_router.dart';

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
                const SizedBox(height: 48),

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

                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Email is not correct';
                    }

                    return null;
                  }, width: double.infinity,
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
                  }, width: double.infinity,
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
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        context.push('/forgotPassword');
                       // print("انتقال الى واجهة سهام");
                      },
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                CustomPrimaryButton(
                  text: 'Sign in',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isUserValid =
                          await _loginData.loginUserLocal();

                      if (!mounted) return;

                      if (isUserValid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login successful!'),
                          ),
                        );

                      context.go('/permissionLocation');
                        
                      } else {
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
                  children: const [
                    SocialButton(
                      iconPath: 'assets/icons/facebook.png',
                    ),
                    SizedBox(width: 16),
                    SocialButton(
                      iconPath: 'assets/icons/google.png',
                    ),
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
                          text: "Don’t have account ? ",
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/register');
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
