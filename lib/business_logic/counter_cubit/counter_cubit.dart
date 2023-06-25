import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(countValue: 0));

  void increment() => emit(CounterState(countValue: state.countValue + 1));
  void decrement() => emit(CounterState(countValue: state.countValue - 1));
}