part of 'color_cubit.dart';

class ColorState extends Equatable {
  const ColorState({required this.color});
  final Color color;
  @override
  List<Object> get props => [color];
}
