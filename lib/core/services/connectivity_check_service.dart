import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@injectable
class ConnectivityCheckService {
  final _connectivityChecker = Connectivity();
  final _internetChecker = InternetConnectionChecker();

  Future<List<ConnectivityResult>> get _connectivityType async =>
      await _connectivityChecker.checkConnectivity();

  Future<bool> get hasSomeConnection async =>
      !(await _connectivityType).contains(ConnectivityResult.none);

  Future<bool> get isWifi async => (await _connectivityType).contains(ConnectivityResult.wifi);

  Future<bool> get isConnectedToInternetFuture async =>
      (await hasSomeConnection) && (await _internetChecker.hasConnection);

  Stream<bool> get isConnectedToInternetStream async* {
    await for (final type in _connectivityChecker.onConnectivityChanged) {
      if (type.contains(ConnectivityResult.ethernet) ||
          type.contains(ConnectivityResult.wifi) ||
          type.contains(ConnectivityResult.mobile)) {
        yield await _internetChecker.hasConnection;
      } else {
        yield false;
      }
    }
  }
}
