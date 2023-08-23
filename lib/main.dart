import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utilities/notification_utiities.dart';
import 'core/utilities/responsive_ui.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/login/domain/usecase/login_usecase.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'injection/container_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationUtilities.initialize();
  NotificationUtilities.requestPermissions();
  await initialDI();
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
          create: (_) => LoginCubit(loginUseCase: sl<LoginUseCase>()),
        ),
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: LoginPage()),
    );
  }
}
