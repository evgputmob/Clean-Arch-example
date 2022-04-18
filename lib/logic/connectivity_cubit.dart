import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import '../data/repository/connectivity_repository.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final ConnectivityRepository _connectivityRepository;

  ConnectivityCubit({required ConnectivityRepository connectivityRepository})
      : _connectivityRepository = connectivityRepository,
        super(const ConnectivityState()) {
    _init();
  }

  Future _init() async {
    final _status = await _connectivityRepository.getCurrentStatus();
    if (_status == ConnectivityResult.none) {
      emit(const ConnectivityState(status: ConnectivityStatus.off));
    } else {
      emit(const ConnectivityState(status: ConnectivityStatus.on));
    }
    // Subscription
    _connectivityRepository.connectionStatusController.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        emit(const ConnectivityState(status: ConnectivityStatus.off));
      } else {
        emit(const ConnectivityState(status: ConnectivityStatus.on));
      }
    });
  }
}
