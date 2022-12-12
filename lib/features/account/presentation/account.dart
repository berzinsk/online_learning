import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
        ],
      ),
    );
  }
}
