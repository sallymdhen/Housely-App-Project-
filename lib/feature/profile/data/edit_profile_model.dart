import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/data/user_model.dart';

class EditProfileData {
  String imageUrl = 'assets/image/user_profile.png';

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  Future<void> loadFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final UserModel? user = await UserModel.getSavedUser();

    fullNameController.text =
        prefs.getString('local_full_name') ??
        user?.username ??
        'Brooklyn Simmons';
    usernameController.text = user?.username ?? 'Brooklynsim';
    emailController.text = user?.email ?? 'brooklynsim@gmail.com';
    dateOfBirthController.text =
        prefs.getString('local_date_of_birth') ?? 'November/21/1992';
  }

  Future<bool> saveProfileLocal() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'local_full_name',
        fullNameController.text.trim(),
      );
      await prefs.setString(
        'local_username',
        usernameController.text.trim(),
      );
      await prefs.setString('local_email', emailController.text.trim());
      await prefs.setString(
        'local_date_of_birth',
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
