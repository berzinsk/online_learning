import 'package:flutter/material.dart';
import 'package:online_learning/features/message/domain/app_notification.dart';
import 'package:online_learning/features/message/presentation/notifications/app_notification_icon.dart';
import 'package:online_learning/resources/constants/colors.dart';

class NotificationItem extends StatelessWidget {
  final AppNotification appNotification;

  const NotificationItem({
    Key? key,
    required this.appNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              offset: const Offset(0, 12),
              color: AppColors.kShadow.withOpacity(0.2),
              spreadRadius: 0.2,
            ),
          ],
        ),
        child: Row(
          children: [
            AppNotificationIcon(
              type: appNotification.type,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appNotification.text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.kDarkBlue,
                          )),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('asset/images/icon_time.png'),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Just now',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.kShadow,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
