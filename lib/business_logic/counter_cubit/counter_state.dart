part of 'counter_cubit.dart';

class CounterState extends Equatable {
  const CounterState({required this.countValue});
  final int countValue;

  CounterState copyWith({int? countValue}) {
    return CounterState(countValue: countValue ?? this.countValue);
  }

  @override
  List<Object> get props => [countValue];
}
