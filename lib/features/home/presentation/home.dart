import 'package:flutter/material.dart';

import 'header.dart';
import 'home_ad.dart';
import 'home_learning_plan.dart';
import 'home_meetup.dart';

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
            padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: HomeLearningPlan(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HomeMeetup(),
          ),
        ],
      ),
    );
  }
}
