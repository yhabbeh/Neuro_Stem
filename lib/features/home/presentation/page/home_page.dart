import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

//import 'package:just_audio/just_audio.dart';

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
          barrierDismissible: false,
          context: context,
          barrierColor: Colors.black26,
          builder: (BuildContext innerContext) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color(0xff00A86B),
              scrollable: true,
              title: const Text(
                  'Please Choose Which your Favorite Music You Are Like:'),
              content: SizedBox(
                height: ResponsiveUI.screenHeight! * 0.35,
                width: ResponsiveUI.screenWidth! * .7,
                child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    padding: const EdgeInsets.all(5),
                    mainAxisSpacing: 7.0,
                    crossAxisSpacing: 7.0,
                    children: [
                      InkWell(
                        onTap: () async {
                          final player = AudioPlayer(); // Create a player
                          final duration = await player.setAsset(
                              'assets/example.mp3'); // Schemes: (https: | file: | asset: )
                          // Play without waiting for completion
                          await player.play();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: ResponsiveUI.screenHeight! * 0.8,
                          width: ResponsiveUI.screenWidth! * 0.4,
                          decoration: BoxDecoration(
                            color: const Color(0xff72EABF),
                            image: const DecorationImage(
                                image: AssetImage('images/national_image.png'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              'National Music ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.8,
                        width: ResponsiveUI.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff72EABF),
                          image: const DecorationImage(
                              image: AssetImage('images/national_image.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'National Music ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.8,
                        width: ResponsiveUI.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff72EABF),
                          image: const DecorationImage(
                              image: AssetImage('images/national_image.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            'National Music ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.8,
                        width: ResponsiveUI.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff72EABF),
                          image: const DecorationImage(
                              image: AssetImage('images/national_image.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            'National Music ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.8,
                        width: ResponsiveUI.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff72EABF),
                          image: const DecorationImage(
                              image: AssetImage('images/national_image.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            'National Music ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveUI.screenHeight! * 0.8,
                        width: ResponsiveUI.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff72EABF),
                          image: const DecorationImage(
                              image: AssetImage('images/national_image.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            'National Music ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
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
