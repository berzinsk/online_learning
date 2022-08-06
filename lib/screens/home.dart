import 'package:flutter/material.dart';

import '../components/home/header.dart';
import '../components/home/home_ad.dart';
import '../components/home/home_learning_plan.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Header(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 18, 20, 18),
            child: HomeAd(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HomeLearningPlan(),
          ),
        ],
      ),
    );
  }
}
