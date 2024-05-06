import 'package:battery_alarm/cubits/alarm_cubit/battery_alarm_cubit.dart';
import 'package:battery_alarm/cubits/battery_cubit/my_battery_cubit.dart';
import 'package:battery_alarm/home/home.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyBatteryCubit()..myBatteryListening(Battery()),
        ),
        BlocProvider(
          create: (context) => BatteryAlarmCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
