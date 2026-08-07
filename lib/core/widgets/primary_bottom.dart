import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryBottom extends StatelessWidget {
  const PrimaryBottom({
    super.key,
    required this.name,
    required this.onPressed,
    required this.width,
  });

  final String name;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor, 
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          name,
          style: AppTextStyle.primaryButton,
        ),
      ),
    );
  }
}