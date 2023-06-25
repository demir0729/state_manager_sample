import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager_sample/business_logic/color_cubit/color_cubit.dart';


class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          context.read<ColorCubit>().changeColor(color);
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
            child: null),
      ),
    );
  }
}
