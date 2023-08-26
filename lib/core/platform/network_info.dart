import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({required this.connectivity});

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async =>
      await connectivity.checkConnectivity() == ConnectivityResult.mobile ||
      await connectivity.checkConnectivity() == ConnectivityResult.wifi;
}
