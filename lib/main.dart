import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/cubit/local_lang_cubit.dart';
import 'core/cubit/local_lang_state.dart';
import 'core/platform/app_local.dart';
import 'core/utilities/cache_helper.dart';
import 'core/utilities/responsive_ui.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/sssssssssssssss.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUI.getScreenDimensions(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => LoginCubit(),
          ),
          BlocProvider(
            create: (_) => HomeCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => LocalCubit()..getSavedLanguage(),
          ),
        ],
        child: BlocBuilder<LocalCubit, LocalState>(
            builder: (BuildContext context, LocalState state) {
          if (state is ChangeLocalState) {
            return MaterialApp(
                locale: state.locale,
                localeResolutionCallback:
                    (Locale? currentLocal, Iterable<Locale> supportedLocales) {
                  for (final Locale locale in supportedLocales) {
                    if (currentLocal != null &&
                        currentLocal.languageCode == locale.languageCode) {
                      return currentLocal;
                    }
                  }
                  return supportedLocales.first;
                },
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', "US"),
                  Locale("ar", ""),
                ],
                debugShowCheckedModeBanner: false,
                home: const HomeScreen());
          }
          return const SizedBox();
        }));
  }
}
