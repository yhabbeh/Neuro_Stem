import 'package:flutter/material.dart';

import '../widgets/EDA_rate.dart';
import '../widgets/heart_rate_widget.dart';
import '../widgets/stress_level.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeartRate(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              EdaWidget(title: 'EDA Rate'),
              EdaWidget(
                title: '%SpO2',
              ),
            ],
          ),
          StressRate(),
        ],
      ),
    ));
  }
}
