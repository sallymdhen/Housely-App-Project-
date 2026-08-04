import 'package:flutter/material.dart';

import '../../../data/user_model/message_user_model.dart';
import '../message_classes/ActiveContactAvatar.dart';
import '../message_classes/AddContactButton.dart';
import '../message_classes/ThinVerticalDivider.dart';

Widget buildActiveContactsRow(List<MessageModel> contacts) {
  return SizedBox(
    height: 64,
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      itemCount: contacts.length + 2,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return AddContactButton(onTap: () {});
        }
        if (index == 1) {
          return ThinVerticalDivider();
        }
        final contact = contacts[index - 2];
        return ActiveContactAvatar(contact: contact);
      },
    ),
  );
}
