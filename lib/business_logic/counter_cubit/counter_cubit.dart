import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_manager_sample/business_logic/color_cubit/color_cubit.dart';
import 'package:state_manager_sample/business_logic/internet_counter/internet_cubit.dart';
import 'package:state_manager_sample/constants/enums.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({
    required this.internetCubit,
    required this.colorCubit,
  }) : super(const CounterState(countValue: 0)) {
    monitorInternetStream();
    monitorColorStream();
  }

  StreamSubscription<InternetState> monitorInternetStream() {
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is WifiOrMobileState &&
          internetState.isConnected == IsConnected.yes) {
        increment();
      } else if (internetState is WifiOrMobileState &&
          internetState.isConnected == IsConnected.no) {
        decrement();
      }
    });
  }

  StreamSubscription<ColorState> monitorColorStream() {
    return colorStreamSubscription = colorCubit.stream.listen((colorState) {
      if (colorState.color == Colors.red ||
          colorState.color == Colors.green ||
          colorState.color == Colors.blue) {
        increment();
      } else {
        decrement();
      }
    });
  }

  void increment() => emit(CounterState(countValue: state.countValue + 1));
  void decrement() => emit(CounterState(countValue: state.countValue - 1));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    colorStreamSubscription.cancel();
    return super.close();
  }

  final InternetCubit internetCubit;
  final ColorCubit colorCubit;

  late final StreamSubscription internetStreamSubscription;
  late final StreamSubscription colorStreamSubscription;
}
