import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager_sample/business_logic/internet_counter/internet_cubit.dart';
import 'package:state_manager_sample/constants/enums.dart';
import 'package:state_manager_sample/presentation/views/second_view.dart';

import '../../business_logic/counter_cubit/counter_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.countValue.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is WifiOrMobileState &&
                    state.isConnected == IsConnected.yes) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<CounterCubit>(context),
                            child: const SecondView(),
                          ),
                        ));
                      },
                      child: const Text('go to second view'));
                } else if (state is WifiOrMobileState &&
                    state.isConnected == IsConnected.no) {
                  return const ElevatedButton(
                      onPressed: null, child: Text('connection error'));
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
