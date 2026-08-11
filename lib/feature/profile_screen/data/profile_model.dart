import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/app_color.dart';
import '../../auth/data/user_model.dart';

class ProfileOptionItem {
  final SvgPicture icon;
  final String title;
  final Color iconColor;

  const ProfileOptionItem({
    required this.icon,
    required this.title,
    required this.iconColor,
  });
}

class UserProfileModel {
  final String imageUrl;
  final String fullName;
  final String email;
  final List<ProfileOptionItem> options;

  const UserProfileModel({
    required this.imageUrl,
    required this.fullName,
    required this.email,
    required this.options,
  });

  // مصنع لبناء البيانات وربطها بالـ UserModel القادم من الـ Auth/Local Storage
  static Future<UserProfileModel> fromUserModel(UserModel? user) async {
    final prefs = await SharedPreferences.getInstance();

    // ✅ نفس منطق الـ key الفريد لكل مستخدم المستخدم بـ EditProfileData
    final String userKey = user?.email ?? 'guest';

    final imageUrl =
        prefs.getString('local_profile_image_$userKey') ??
        'assets/image/user_profile.png';

    return UserProfileModel(
      imageUrl: imageUrl,
      fullName:
          prefs.getString('local_full_name_$userKey') ??
          user?.username ??
          'Brooklyn Simmons',
      email:
          prefs.getString('local_email_$userKey') ??
          user?.email ??
          'brooklynsim@gmail.com',
      options: [
        ProfileOptionItem(
          icon: SvgPicture.asset("assets/icons/Setting.svg"),
          title: 'Settings',
          iconColor: AppColor.primaryColor,
        ),
        ProfileOptionItem(
          icon: SvgPicture.asset("assets/icons/Payment.svg"),
          title: 'Payment',
          iconColor: AppColor.primaryColor,
        ),
        ProfileOptionItem(
          icon: SvgPicture.asset("assets/icons/Notification.svg"),
          title: 'Notification',
          iconColor: AppColor.primaryColor,
        ),
        ProfileOptionItem(
          icon: SvgPicture.asset("assets/icons/Recent Viewed.svg"),
          title: 'Recent Viewed',
          iconColor: AppColor.primaryColor,
        ),
        ProfileOptionItem(
          icon: SvgPicture.asset("assets/icons/Info Square.svg"),
          title: 'About',
          iconColor: AppColor.primaryColor,
        ),
      ],
    );
  }
}
