import 'package:bloc/bloc.dart';
import 'package:breaking_bad_bloc_app/data/services/i_connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final IConnectivityService _connectivityService;

  ConnectivityCubit({required IConnectivityService connectivityService})
      : _connectivityService = connectivityService,
        super(const ConnectivityState()) {
    _init();
  }

  Future _init() async {
    final _status = await _connectivityService.getCurrentStatus();
    if (_status == ConnectivityResult.none) {
      emit(const ConnectivityState(status: ConnectivityStatus.off));
    } else {
      emit(const ConnectivityState(status: ConnectivityStatus.on));
    }
    // Subscription
    _connectivityService.connectionStatusController.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        emit(const ConnectivityState(status: ConnectivityStatus.off));
      } else {
        emit(const ConnectivityState(status: ConnectivityStatus.on));
      }
    });
  }
}
