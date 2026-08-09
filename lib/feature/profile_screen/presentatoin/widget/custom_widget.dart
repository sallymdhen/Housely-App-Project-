import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_fonts.dart';

// 1. الصورة الشخصية مع شارة الكاميرا المصغرة
class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onCameraTap;

  const ProfileAvatar({Key? key, required this.imageUrl, this.onCameraTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: AppColor.facebookColor,
            backgroundImage: imageUrl.startsWith('assets/')
                ? AssetImage(imageUrl) as ImageProvider
                : FileImage(File(imageUrl)),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            top: 76,
            left: 66,
            child: GestureDetectingWidget(
              onTap: onCameraTap,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/Camera.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. تفاصيل الاسم والإيميل
class UserDetails extends StatelessWidget {
  final String fullName;
  final String email;

  const UserDetails({Key? key, required this.fullName, required this.email})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fullName,
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.inter,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          email,
          style: TextStyle(
            color: AppColor.greyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.inter,
          ),
        ),
      ],
    );
  }
}

// 3. عنصر القائمة التفاعلي (Row)
class ProfileOptionTile extends StatelessWidget {
  final SvgPicture iconData;
  final String title;
  final Color iconColor;
  final VoidCallback? onTap;

  const ProfileOptionTile({
    Key? key,
    required this.iconData,
    required this.title,
    required this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            iconData,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.inter,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColor.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}

// 4. زر تسجيل الخروج الاحمر
class SignOutButton extends StatelessWidget {
  final VoidCallback onTap;

  const SignOutButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'Sign Out',
          style: TextStyle(
            color: AppColor.redColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.inter,
          ),
        ),
      ),
    );
  }
}

// ويدجت مساعد للضغط
class GestureDetectingWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const GestureDetectingWidget({Key? key, required this.child, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: child,
    );
  }
}
