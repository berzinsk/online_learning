import 'package:flutter/material.dart';
import 'package:online_learning/features/account/presentation/account_menu_item.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'asset/images/profile_picture.jpeg',
                      ),
                      maxRadius: 40,
                    ),
                    Image(
                      image: AssetImage('asset/images/icon_camera.png'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            AccountMenuItem(
              name: 'Favorite',
              onPress: () {
                // ignore: avoid_print
                print('On Favorite press');
              },
            ),
            AccountMenuItem(
              name: 'Edit Account',
              onPress: () {
                // ignore: avoid_print
                print('On Edit Account press');
              },
            ),
            AccountMenuItem(
              name: 'Settings and Privacy',
              onPress: () {
                // ignore: avoid_print
                print('On Settings and Privacy press');
              },
            ),
            AccountMenuItem(
              name: 'Help',
              onPress: () {
                // ignore: avoid_print
                print('On Help press');
              },
            ),
          ],
        ),
      ),
    );
  }
}
