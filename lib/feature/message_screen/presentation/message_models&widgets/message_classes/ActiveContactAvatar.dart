import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../data/user_model/message_user_model.dart';

class ActiveContactAvatar extends StatelessWidget {
  final MessageModel contact;

  ActiveContactAvatar({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.primaryColor, width: 2.5),
      ),
      child: CircleAvatar(backgroundImage: NetworkImage(contact.avatarUrl)),
    );
  }
}
