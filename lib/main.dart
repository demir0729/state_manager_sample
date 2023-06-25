import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager_sample/presentation/views/home_view.dart';

import 'business_logic/cubit/counter_cubit.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const HomeView(),
      ),
    );
  }
}
