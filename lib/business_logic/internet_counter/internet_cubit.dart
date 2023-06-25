import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:state_manager_sample/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    internetStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        internetStateChange(IsConnected.yes);
      } else {
        internetStateChange(IsConnected.no);
      }
    });
  }

  final Connectivity connectivity;
  late final StreamSubscription internetStreamSubscription;
  void internetStateChange(IsConnected isConnected) =>
      emit(WifiOrMobileState(isConnected: isConnected));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
