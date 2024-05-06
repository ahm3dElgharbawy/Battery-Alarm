part of 'my_battery_cubit.dart';

@immutable
sealed class MyBatteryState {}

final class MyBatteryInitial extends MyBatteryState {}

final class MyBatteryFull extends MyBatteryState {}

final class MyBatteryCharging extends MyBatteryState {
  final int progress;
  MyBatteryCharging({required this.progress});
}

final class MyBatteryDischarging extends MyBatteryState {
  final int progress;
  MyBatteryDischarging({required this.progress});
}
