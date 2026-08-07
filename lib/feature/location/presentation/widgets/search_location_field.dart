import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchLocationField extends StatelessWidget {
  final TextEditingController controller;

  const SearchLocationField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
  controller: controller,
  textAlignVertical: TextAlignVertical.center,
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: "Search Location",
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 18.sp,
    ),
    prefixIcon: SizedBox(
      width: 52.w,
      child: Center(
        child: Image.asset(
          'assets/icons/Hide.png',
          width: 24.w,
          height: 24.w,
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),
)
    );
  }
}
