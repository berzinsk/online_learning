import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      color: AppColors.kPrimaryBlue,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Karlis',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  'Let\'s start learning',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('asset/images/profile_picture.jpeg'),
              maxRadius: 25,
            )
          ],
        ),
      ),
    );
  }
}
