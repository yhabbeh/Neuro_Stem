class ServerException implements Exception {}

class CacheException implements Exception {}

class ServerrException implements Exception {
  final String serverException;
  ServerrException(this.serverException);
}

class NoAccessException implements Exception {
  final String noAccess;
  NoAccessException(this.noAccess);
}

class NoInternetException implements Exception {
  final String noInternet;
  NoInternetException({required this.noInternet});
}