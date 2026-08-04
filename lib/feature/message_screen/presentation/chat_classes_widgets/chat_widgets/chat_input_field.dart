// lib/feature/chat_screen/presentation/widgets/chat_input_field.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add, color: AppColor.primaryColor2, size: 28),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'write your message',
                  hintStyle: TextStyle(color: AppColor.greyColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: AppColor.primaryColor2,
            radius: 22,
            child: IconButton(
              icon: Icon(
                Icons.send_rounded,
                color: AppColor.whiteColor,
                size: 20,
              ),
              onPressed: onSend,
            ),
          ),
        ],
      ),
    );
  }
}
