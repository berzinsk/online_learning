import 'package:flutter/material.dart';

import '../components/home/header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Header(),
        ],
      ),
    );
  }
}
