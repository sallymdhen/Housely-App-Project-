import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  factory UserProfileModel.fromUserModel(UserModel? user) {
    return UserProfileModel(
      imageUrl: 'assets/image/user_profile.png', // مسار صورة البروفايل لديك
      fullName: user?.username ?? 'Brooklyn Simmons',
      email: user?.email ?? 'brooklynsim@gmail.com',
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
