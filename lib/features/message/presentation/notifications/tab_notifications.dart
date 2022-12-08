import 'package:flutter/material.dart';
import 'package:online_learning/features/message/data/demo_app_notifications.dart';
import 'package:online_learning/features/message/domain/app_notification.dart';
import 'package:online_learning/features/message/presentation/notifications/notification_item.dart';

class TabNotifications extends StatelessWidget {
  final List<AppNotification> _appNotifications = demoNotifications;
  TabNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => NotificationItem(
        appNotification: _appNotifications[index],
      ),
      itemCount: _appNotifications.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
