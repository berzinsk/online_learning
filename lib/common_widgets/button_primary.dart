import 'package:flutter/material.dart';

import '../resources/constants/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const ButtonPrimary({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.kPrimaryBlue,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
