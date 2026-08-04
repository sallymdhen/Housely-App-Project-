import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../data/user_model/message_user_model.dart';
import '../message_classes/MessageListTile.dart';
import '../message_classes/MessageTileDivider.dart';
import '../message_classes/SwipeableMessageTile.dart';

Widget buildMessageList({
  required List<MessageModel> messages,
  required Map<String, GlobalKey<SwipeableMessageTileState>> tileKeys,
  required void Function(String messageId) onTileOpened,
  required void Function(MessageModel message) onMore,
  required void Function(MessageModel message) onDelete,
}) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemCount: messages.length,
    separatorBuilder: (_, __) => MessageTileDivider(),
    itemBuilder: (context, index) {
      final message = messages[index];

      final key = tileKeys.putIfAbsent(
        message.id,
        () => GlobalKey<SwipeableMessageTileState>(),
      );

      return SwipeableMessageTile(
        key: key,
        tileKey: message.id,
        onOpened: onTileOpened,
        onMore: () => onMore(message),
        onDelete: () {
          onDelete(message);
        },
        onTap: () {
          _navigateToChat(context, message);
        },
        child: MessageListTile(
          message: message,
          onTap: () {
            _navigateToChat(context, message);
          },
        ),
      );
    },
  );
}

void _navigateToChat(BuildContext context, MessageModel message) {
  context.push(
    '/chat',
    extra: {'userName': message.name, 'userAvatar': message.avatarUrl},
  );
}
