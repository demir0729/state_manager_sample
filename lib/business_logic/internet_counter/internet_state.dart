part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {}

class InternetLoading extends InternetState {
  @override
  List<Object?> get props => [];
}

class WifiOrMobileState extends InternetState {
  final IsConnected isConnected;

  WifiOrMobileState({required this.isConnected});

  @override
  List<Object?> get props => [isConnected];
}
