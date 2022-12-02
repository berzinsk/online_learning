import 'package:flutter/material.dart';
import 'package:online_learning/model/message.dart';
import 'package:online_learning/resources/constants/colors.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.kBaseGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            message.author,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: AppColors.kDarkBlue,
                                ),
                          ),
                          Text(
                            '4.29 pm',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.kPrimaryTextGray,
                                    ),
                          ),
                        ],
                      ),
                      Text(
                        'Online',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: AppColors.kPrimaryTextGray,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              message.text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kPrimaryTextGray,
                  ),
            ),
            if (message.imageUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.kLightPing,
                  ),
                  height: 145,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
