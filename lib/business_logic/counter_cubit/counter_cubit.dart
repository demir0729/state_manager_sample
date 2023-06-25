import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_manager_sample/business_logic/internet_counter/internet_cubit.dart';
import 'package:state_manager_sample/constants/enums.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({required this.internetCubit})
      : super(const CounterState(countValue: 0)) {
    streamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is WifiOrMobileState &&
          internetState.isConnected == IsConnected.yes) {
        increment();
      } else if (internetState is WifiOrMobileState &&
          internetState.isConnected == IsConnected.no) {
        decrement();
      }
    });
  }

  final InternetCubit internetCubit;
  late final StreamSubscription streamSubscription;
  void increment() => emit(CounterState(countValue: state.countValue + 1));
  void decrement() => emit(CounterState(countValue: state.countValue - 1));
}
