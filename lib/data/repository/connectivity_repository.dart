import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/i_connectivity_service.dart';

class ConnectivityRepository {
  final IConnectivityService _connectivityService;

  ConnectivityRepository({required IConnectivityService connectivityService})
      : _connectivityService = connectivityService;

  StreamController<ConnectivityResult> get connectionStatusController =>
      _connectivityService.connectionStatusController;

  Future<ConnectivityResult> getCurrentStatus() =>
      _connectivityService.getCurrentStatus();
}
