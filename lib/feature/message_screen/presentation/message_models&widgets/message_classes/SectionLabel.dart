import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  SectionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
