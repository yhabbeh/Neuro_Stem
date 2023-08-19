import 'package:flutter/material.dart';

import '../../../../core/utilities/responsive_ui.dart';
import '../widgets/EDA_rate.dart';
import '../widgets/heart_rate_widget.dart';
import '../widgets/stress_level.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      await showDialog(
          context: context,
          builder: (BuildContext innerContext) => AlertDialog(
              scrollable: true,
              title: const Text(
                  'Please Choose Which your Favorite Music You Are Like:'),
              content: SizedBox(
                height: ResponsiveUI.screenHeight! * 0.35,
                width: ResponsiveUI.screenWidth! * .7,
                child: GridView.count(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: [
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.15,
                        width: ResponsiveUI.screenWidth! * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(child: Text('helllow music')),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.15,
                        width: ResponsiveUI.screenWidth! * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(child: Text('helllow music')),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.15,
                        width: ResponsiveUI.screenWidth! * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(child: Text('helllow music')),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.15,
                        width: ResponsiveUI.screenWidth! * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(child: Text('helllow music')),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.15,
                        width: ResponsiveUI.screenWidth! * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(child: Text('helllow music')),
                      ),
                    ]),
              )));
    });

    super.initState();
  }

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
