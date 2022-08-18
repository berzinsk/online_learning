import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class CourseFilterRowItem extends StatelessWidget {
  final bool isSelected;
  final int buttonIndex;
  final String title;
  final void Function(int index) onButtonPress;

  const CourseFilterRowItem({
    Key? key,
    required this.buttonIndex,
    required this.title,
    required this.onButtonPress,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor:
              isSelected ? AppColors.kPrimaryBlue : Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          side: const BorderSide(color: Colors.transparent),
        ),
        onPressed: () {
          onButtonPress(buttonIndex);
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isSelected ? Colors.white : AppColors.kPrimaryTextGray),
        ),
      ),
    );
  }
}
