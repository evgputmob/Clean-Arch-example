part of 'connectivity_cubit.dart';

enum ConnectivityStatus { initial, on, off }

class ConnectivityState extends Equatable {
  final ConnectivityStatus status;

  const ConnectivityState({this.status = ConnectivityStatus.initial});

  @override
  List<Object?> get props => [status];
}
