part of 'my_battery_cubit.dart';

@immutable
sealed class MyBatteryState {}

final class MyBatteryDischarging extends MyBatteryState {
  MyBatteryDischarging();
}

final class MyBatteryCharging extends MyBatteryState {
  MyBatteryCharging();
}

final class MyBatteryFull extends MyBatteryState {
  MyBatteryFull();

}

