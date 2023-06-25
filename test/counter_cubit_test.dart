import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_manager_sample/business_logic/color_cubit/color_cubit.dart';
import 'package:state_manager_sample/business_logic/counter_cubit/counter_cubit.dart';
import 'package:state_manager_sample/business_logic/internet_counter/internet_cubit.dart';
import 'package:state_manager_sample/constants/enums.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    setUp(() => counterCubit = CounterCubit(
          internetCubit: InternetCubit(connectivity: Connectivity()),
          colorCubit: ColorCubit(),
        ));

    tearDown(() => counterCubit!.close());

    blocTest(
      'is function increment running successfully?',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => const [CounterState(countValue: 1)],
    );

    blocTest(
      'is function decrement running successfully?',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => const [CounterState(countValue: -1)],
    );
  });

  group('InternetCubit', () {
    InternetCubit? internetCubit;
    setUp(() => internetCubit = InternetCubit(connectivity: Connectivity()));

    tearDown(() => internetCubit!.close());

    blocTest<InternetCubit, InternetState>(
      'is isconnected.yes running successfully in WifiOrMobileState?',
      build: () => internetCubit!,
      act: (cubit) => cubit.internetStateChange(IsConnected.yes),
      expect: () =>
          <InternetState>[WifiOrMobileState(isConnected: IsConnected.yes)],
    );
    blocTest(
      'is isconnected.no running successfully in WifiOrMobileState?',
      build: () => internetCubit!,
      act: (cubit) => cubit.internetStateChange(IsConnected.no),
      expect: () => [WifiOrMobileState(isConnected: IsConnected.no)],
    );
  });
}
