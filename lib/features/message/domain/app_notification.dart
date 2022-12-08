enum AppNotificationType {
  purchase,
  message,
}

class AppNotification {
  final String text;
  final DateTime dateCreated;
  final AppNotificationType type;

  const AppNotification({
    required this.text,
    required this.type,
    required this.dateCreated,
  });
}
