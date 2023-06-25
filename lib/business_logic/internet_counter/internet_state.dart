part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class WifiOrMobileState extends InternetState {
  final IsConnected isConnected;

  const WifiOrMobileState({required this.isConnected});
}
