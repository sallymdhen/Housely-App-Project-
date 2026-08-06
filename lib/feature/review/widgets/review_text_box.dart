import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';

class ReviewTextBox extends StatelessWidget {
  final TextEditingController controller;

  const ReviewTextBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      maxLines: 5,

      decoration: const InputDecoration(
        hintText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard  ",

        border: InputBorder.none,

        contentPadding: EdgeInsets.only(left: 12, right: 12, top: 8),
      ),

      style: AppTextStyle.hintText.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
