import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class HomeAd extends StatelessWidget {
  const HomeAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.kAdBlue,
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What do you want to learn today?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.kDarkBlue),
                ),
                const Spacer(),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    side: const BorderSide(color: Colors.transparent),
                    backgroundColor: AppColors.kButtonOrange,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                children: const [
                  Spacer(),
                  Image(
                    width: 118,
                    height: 134,
                    image: AssetImage('asset/images/home_ad.png'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
