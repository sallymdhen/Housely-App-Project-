import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool isPasswordHidden = true;

  Future<bool> loginUserLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedEmail = prefs.getString('local_email');
      String? savedPassword = prefs.getString('local_password');

      if (emailController.text.trim() == savedEmail &&
          passwordController.text.trim() == savedPassword) {
        if (rememberMe) {
          await prefs.setBool('is_logged_in', true);
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

class RegisterData {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordHidden = true;

  Future<void> registerUserLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('local_email', emailController.text.trim());
      await prefs.setString('local_username', usernameController.text.trim());
      await prefs.setString('local_password', passwordController.text.trim());
    } catch (e) {}
  }

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
