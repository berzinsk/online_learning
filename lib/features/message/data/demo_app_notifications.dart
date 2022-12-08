import 'package:online_learning/features/message/domain/app_notification.dart';

List<AppNotification> demoNotifications = [
  AppNotification(
    text: 'Successful purchase!',
    type: AppNotificationType.purchase,
    dateCreated: DateTime.now(),
  ),
  AppNotification(
    text: 'Congratulations on completing the course about Design Thinking.',
    type: AppNotificationType.message,
    dateCreated: DateTime.now(),
  ),
  AppNotification(
    text:
        'Your course has been updated, you  can view it in My Courses section.',
    type: AppNotificationType.message,
    dateCreated: DateTime.now(),
  ),
  AppNotification(
    text:
        'Congratulations, you have won a prize. Please see your email for more details.',
    type: AppNotificationType.message,
    dateCreated: DateTime.now(),
  ),
];
