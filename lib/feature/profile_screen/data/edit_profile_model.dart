import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/data/user_model.dart';

class EditProfileData {
  String imageUrl = 'assets/image/user_profile.png';
  String _userKey = 'guest'; // ✅ جديد: مفتاح فريد لكل مستخدم

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  Future<void> loadFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final UserModel? user = await UserModel.getSavedUser();

    // ✅ نحدد مفتاح المستخدم بناءً على الإيميل (فريد لكل حساب)
    _userKey = user?.email ?? 'guest';

    fullNameController.text =
        prefs.getString('local_full_name_$_userKey') ??
        user?.username ??
        'Brooklyn Simmons';
    usernameController.text = user?.username ?? 'Brooklynsim';
    emailController.text = user?.email ?? 'brooklynsim@gmail.com';
    dateOfBirthController.text =
        prefs.getString('local_date_of_birth_$_userKey') ?? 'November/21/1992';

    // ✅ قراءة الصورة الخاصة بهاد المستخدم فقط
    imageUrl =
        prefs.getString('local_profile_image_$_userKey') ??
        'assets/image/user_profile.png';
  }

  Future<void> updateProfileImage(String newPath) async {
    imageUrl = newPath;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('local_profile_image_$_userKey', newPath);
  }

  Future<bool> saveProfileLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'local_full_name_$_userKey',
        fullNameController.text.trim(),
      );
      await prefs.setString(
        'local_username_$_userKey',
        usernameController.text.trim(),
      );
      await prefs.setString(
        'local_email_$_userKey',
        emailController.text.trim(),
      );
      await prefs.setString(
        'local_date_of_birth_$_userKey',
        dateOfBirthController.text.trim(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    dateOfBirthController.dispose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../auth/data/user_model.dart';
//
// class EditProfileData {
//   String imageUrl = 'assets/image/user_profile.png';
//
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController dateOfBirthController = TextEditingController();
//
//   Future<void> loadFromPrefs() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final UserModel? user = await UserModel.getSavedUser();
//
//     fullNameController.text =
//         prefs.getString('local_full_name') ??
//         user?.username ??
//         'Brooklyn Simmons';
//     usernameController.text = user?.username ?? 'Brooklynsim';
//     emailController.text = user?.email ?? 'brooklynsim@gmail.com';
//     dateOfBirthController.text =
//         prefs.getString('local_date_of_birth') ?? 'November/21/1992';
//
//     // ✅ هاد السطر الناقص
//     imageUrl = prefs.getString('local_profile_image') ?? imageUrl;
//   }
//
//   Future<void> updateProfileImage(String newPath) async {
//     imageUrl = newPath;
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('local_profile_image', newPath);
//   }
//
//   Future<bool> saveProfileLocal() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('local_full_name', fullNameController.text.trim());
//       await prefs.setString('local_username', usernameController.text.trim());
//       await prefs.setString('local_email', emailController.text.trim());
//       await prefs.setString(
//         'local_date_of_birth',
//         dateOfBirthController.text.trim(),
//       );
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   void dispose() {
//     fullNameController.dispose();
//     usernameController.dispose();
//     emailController.dispose();
//     dateOfBirthController.dispose();
//   }
// }
