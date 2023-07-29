import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(children: [
        Column(
          children: [
            Placeholder(
              color: Colors.red,
            )
          ],
        )
      ]),
    );
  }
}
