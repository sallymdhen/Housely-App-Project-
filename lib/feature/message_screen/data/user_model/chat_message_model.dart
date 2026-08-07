enum MessageType { text, property }

class ChatMessageModel {
  final String id;
  final String senderId;
  final String? text;
  final String time;
  final bool isMe;
  final MessageType type;

  final String? propertyTitle;
  final String? propertyLocation;
  final String? propertyPrice;
  final String? propertyImageUrl;

  ChatMessageModel({
    required this.id,
    required this.senderId,
    this.text,
    required this.time,
    required this.isMe,
    this.type = MessageType.text,
    this.propertyTitle,
    this.propertyLocation,
    this.propertyPrice,
    this.propertyImageUrl,
  });
}
