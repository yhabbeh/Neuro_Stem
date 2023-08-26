
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../core/platform/network_info.dart';
import 'login_injection.dart';

GetIt sl = GetIt.instance;//sl => service locator
Future<void> initialDI()async{
  sl.registerFactory<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl<Connectivity>()));
  sl.registerLazySingleton(() => Connectivity());
  loginInjection(sl);
  
}