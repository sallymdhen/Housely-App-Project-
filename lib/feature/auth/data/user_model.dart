import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// كلاس بسيط لتمثيل البيانات في التطبيق
class UserModel {
  final String username;
  final String email;

  const UserModel({required this.username, required this.email});

  // تابع لجلب بيانات المستخدم المحفوظة محلياً للبروفايل
  static Future<UserModel?> getSavedUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('local_username');
    String? email = prefs.getString('local_email');

    if (username != null && email != null) {
      return UserModel(username: username, email: email);
    }
    return null;
  }
}

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
        // حفظ حالة الجلسة عند تسجيل الدخول
        if (rememberMe) {
          await prefs.setBool('is_logged_in', true);
        } else {
          await prefs.setBool('is_logged_in', false);
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

  Future<bool> registerUserLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('local_email', emailController.text.trim());
      await prefs.setString('local_username', usernameController.text.trim());
      await prefs.setString('local_password', passwordController.text.trim());
      await prefs.setBool('is_logged_in', true);
      return true;
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
