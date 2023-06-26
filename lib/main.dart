import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:state_manager_sample/business_logic/color_cubit/color_cubit.dart';
import 'package:state_manager_sample/business_logic/internet_counter/internet_cubit.dart';
import 'package:state_manager_sample/core/cache/hive_cache.dart';
import 'package:state_manager_sample/core/init/app_init.dart';
import 'package:state_manager_sample/presentation/views/home_view.dart';

import 'business_logic/counter_cubit/counter_cubit.dart';

Future<void> main(List<String> args) async {
  ApplicationInit.init();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => CounterCubit(
            countCacheManager: CountCacheManager(),
            colorCubit: BlocProvider.of<ColorCubit>(context),
            internetCubit: BlocProvider.of<InternetCubit>(context),
          ),
          child: const HomeView(),
        ),
      ),
    );
  }
}
