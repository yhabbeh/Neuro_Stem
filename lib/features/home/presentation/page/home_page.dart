import 'package:flutter/material.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../widgets/aspectratio_chat_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
                height: ResponsiveUI.screenHeight! * 0.3,
                width: ResponsiveUI.screenWidth! * 0.9,
                child: const LineChartSample2())
          ],
        ),
        Column(),
      ]),
    );
  }
}
