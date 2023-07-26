class ServerException implements Exception {}

class CacheException implements Exception {}

class ServerrException implements Exception {
  ServerrException(this.serverException);
  final String serverException;
}

class NoAccessException implements Exception {
  NoAccessException(this.noAccess);
  final String noAccess;
}

class NoInternetException implements Exception {
  NoInternetException({required this.noInternet});
  final String noInternet;
}