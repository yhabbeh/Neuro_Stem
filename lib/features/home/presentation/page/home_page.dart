import 'package:flutter/material.dart';
import '../widgets/heart_rate_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(children: [
          HeartRate(),
        ],)

    );
  }
}
