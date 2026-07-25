import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_text_style.dart';

// حقل تاريخ الميلاد مع أيقونة التقويم
class DateOfBirthField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCalendarTap;

  const DateOfBirthField({
    Key? key,
    required this.controller,
    required this.onCalendarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date of birth', style: AppTextStyle.labelTextStyle),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onCalendarTap,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: AppColor.blackColor, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 17,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.greyColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.redColor, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.redColor, width: 2),
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Calendar.svg',
                width: 20,
                height: 22,
              ),
              onPressed: onCalendarTap,
            ),
          ),
        ),
      ],
    );
  }
}
