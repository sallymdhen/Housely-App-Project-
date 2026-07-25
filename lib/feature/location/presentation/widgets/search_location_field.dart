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
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.primaryColor,
            size: 30.sp,
          ),
          hintText: "Search Location",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18.sp),
        ),
      ),
    );
  }
}
