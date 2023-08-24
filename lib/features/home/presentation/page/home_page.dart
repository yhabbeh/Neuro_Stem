import 'package:flutter/material.dart';
import 'package:neuro_stem/features/home/presentation/cubit/home_cubit.dart';

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
              // backgroundColor: const Color(),
              scrollable: true,
              title: const Text(
                  'Please Choose Which your Favorite Music You Are Like:'),
              content: SizedBox(
                height: ResponsiveUI.screenHeight! * 0.4,
                width: ResponsiveUI.screenWidth! * .7,
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ResponsiveUI.screenHeight! * 0.005),
                      child: InkWell(
                        onTap: () {
                          HomeCubit.get(context).typesOfMusic[index].onTap!();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: ResponsiveUI.screenHeight! * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(HomeCubit.get(context)
                                    .typesOfMusic[index]
                                    .imagePath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              HomeCubit.get(context).typesOfMusic[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  backgroundColor:
                                      Colors.white54.withOpacity(0.4),
                                  shadows: const [Shadow(color: Colors.red)]),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: HomeCubit.get(context).typesOfMusic.length,
                ),
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
