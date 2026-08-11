import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../data/user_model/message_user_model.dart';

class MessageListTile extends StatelessWidget {
  final MessageModel message;
  final VoidCallback? onTap;

  MessageListTile({super.key, required this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
               backgroundImage: AssetImage(message.avatarUrl),
              //backgroundImage: NetworkImage(message.avatarUrl),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    message.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.subtitleText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Text(
              message.timestamp,
              style: TextStyle(fontSize: 12, color: AppColor.subtitleText),
            ),
          ],
        ),
      ),
    );
  }
}
