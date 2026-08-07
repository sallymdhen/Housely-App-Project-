import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/feature/message_screen/presentation/message_models&widgets/message_widgets/DeleteConfirmationSheet.dart';
import 'package:go_router/go_router.dart';

import '../../data/user_model/message_user_model.dart';
import '../message_models&widgets/message_classes/MessageAppBar.dart';
import '../message_models&widgets/message_classes/SwipeableMessageTile.dart';
import '../message_models&widgets/message_widgets/buildActiveContactsRow.dart';
import '../message_models&widgets/message_widgets/buildMessageList.dart';
import '../message_models&widgets/message_widgets/buildSectionHeader.dart';

class MessageScreen extends StatefulWidget {
  final bool? bottonSheet;
  const MessageScreen({super.key, this.bottonSheet});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late List<MessageModel> messages;
  late final List<MessageModel> activeContacts;

  final Map<String, GlobalKey<SwipeableMessageTileState>> tileKeys = {};

  String? openTileId;
  bool showDeleteSheet = false;
  MessageModel? messageToDelete;
  @override
  void initState() {
    super.initState();
    messages = List<MessageModel>.from(MessageModel.mockMessages());
    activeContacts = MessageModel.mockActiveContacts();
  }

  void _handleTileOpened(String messageId) {
    if (openTileId != null && openTileId != messageId) {
      tileKeys[openTileId]?.currentState?.close();
    }
    openTileId = messageId;
  }

  void handleMore(MessageModel message) {
    debugPrint('More tapped for ${message.name}');
  }

  void handleDelete(MessageModel message) {
    messageToDelete = message;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.whiteColor,
      barrierColor: AppColor.blackColor,
      builder: (context) {
        return DeleteConfirmationSheet(
          onCancel: () {
            Navigator.of(context).pop();
            handleCancel();
          },
          onConfirmDelete: () {
            Navigator.of(context).pop();
            handleConfirmDelete();
          },
        );
      },
    );
  }

  void handleCancel() {
    setState(() {
      if (messageToDelete != null) {
        tileKeys[messageToDelete!.id]?.currentState?.close();
      }
      messageToDelete = null;
    });
  }

  void handleConfirmDelete() {
    setState(() {
      if (messageToDelete != null) {
        messages.removeWhere((m) => m.id == messageToDelete!.id);
        tileKeys.remove(messageToDelete!.id);
        if (openTileId == messageToDelete!.id) {
          openTileId = null;
        }
      }
      messageToDelete = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: MessageAppBar(
        onBackPressed: () {
          context.go("/home");
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildActiveContactsRow(activeContacts),
            const SizedBox(height: 20),
            buildSectionHeader(),
            const SizedBox(height: 8),
            Expanded(
              child: buildMessageList(
                messages: messages,
                tileKeys: tileKeys,
                onTileOpened: _handleTileOpened,
                onMore: handleMore,
                onDelete: handleDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
