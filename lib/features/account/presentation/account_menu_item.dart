import 'package:flutter/material.dart';
import 'package:online_learning/resources/constants/colors.dart';

class AccountMenuItem extends StatelessWidget {
  final String name;
  final Function()? onPress;

  const AccountMenuItem({
    Key? key,
    required this.name,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.kDarkBlue,
                  ),
            ),
            const Image(
              image: AssetImage('asset/images/icon_arrow_right.png'),
            ),
          ],
        ),
      ),
    );
  }
}
