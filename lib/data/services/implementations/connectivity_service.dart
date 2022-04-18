import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../i_connectivity_service.dart';

class ConnectivityService implements IConnectivityService {
  @override
  final connectionStatusController = StreamController<ConnectivityResult>();

  final _connectivity = Connectivity();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((event) {
      connectionStatusController.add(event);
    });
  }

  @override
  Future<ConnectivityResult> getCurrentStatus() async {
    return await _connectivity.checkConnectivity();
  }
}
