import 'package:flutter/material.dart';
import 'package:online_learning/features/message/domain/app_notification.dart';
import 'package:online_learning/resources/constants/colors.dart';

class AppNotificationIcon extends StatelessWidget {
  final AppNotificationType type;
  const AppNotificationIcon({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconAsset = type == AppNotificationType.purchase
        ? 'asset/images/icon_bank_card.png'
        : 'asset/images/icon_message.png';

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: type == AppNotificationType.purchase
            ? AppColors.kLighOrange
            : AppColors.kLightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image(image: AssetImage(iconAsset)),
    );
  }
}
