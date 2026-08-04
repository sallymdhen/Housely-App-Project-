import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../data/user_model/chat_message_model.dart';
import '../chat_classes_widgets/chat_widgets/chat_app_bar.dart';
import '../chat_classes_widgets/chat_widgets/chat_bubble.dart';
import '../chat_classes_widgets/chat_widgets/chat_input_field.dart';
import '../chat_classes_widgets/chat_widgets/property_card_bubble.dart';

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String userAvatar;

  const ChatDetailScreen({
    super.key,
    required this.userName,
    required this.userAvatar,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  late List<ChatMessageModel> messages;

  @override
  void initState() {
    super.initState();
    messages = [
      ChatMessageModel(
        id: '1',
        senderId: 'me',
        time: '1:22 AM',
        isMe: true,
        type: MessageType.property,
        propertyTitle: 'Ayana Homestay',
        propertyLocation: 'Imogiri, Yogyakarta',
        propertyPrice: '310',
        propertyImageUrl:
            'https://images.unsplash.com/photo-1580587771525-78b9dba3b914',
      ),
      ChatMessageModel(
        id: '2',
        senderId: 'me',
        text: 'Hello we are interested in this how about the price ?',
        time: '1:22 AM',
        isMe: true,
      ),
      ChatMessageModel(
        id: '3',
        senderId: 'me',
        text: 'can it be negotiated ?',
        time: '1:22 AM',
        isMe: true,
      ),
      ChatMessageModel(
        id: '4',
        senderId: 'other',
        text: 'Hi there, the price is negotiable',
        time: '1:30 AM',
        isMe: false,
      ),
    ];
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      messages.add(
        ChatMessageModel(
          id: DateTime.now().toString(),
          senderId: 'me',
          text: _messageController.text.trim(),
          time: 'Just now',
          isMe: true,
        ),
      );
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: ChatAppBar(
        userName: widget.userName,
        userAvatar: widget.userAvatar,
        onBackPressed: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Today',
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  if (message.type == MessageType.property) {
                    return PropertyCardBubble(
                      imageUrl: message.propertyImageUrl!,
                      title: message.propertyTitle!,
                      location: message.propertyLocation!,
                      price: message.propertyPrice!,
                    );
                  }
                  return ChatBubble(
                    text: message.text ?? '',
                    time: message.time,
                    isMe: message.isMe,
                    avatarUrl: message.isMe ? null : widget.userAvatar,
                  );
                },
              ),
            ),
            ChatInputField(
              controller: _messageController,
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
