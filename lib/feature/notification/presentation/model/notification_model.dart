class NotificationModel {
  final String message;
  final String? name;
  final String? image;
  final bool isMessage;
  final bool showNotificationIcon;

  const NotificationModel({
    required this.message,
    this.name,
    this.image,
    this.isMessage = false,
    this.showNotificationIcon = true,
  });
}
