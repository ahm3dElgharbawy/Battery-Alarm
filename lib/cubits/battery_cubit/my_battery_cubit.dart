import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

part 'my_battery_state.dart';

class MyBatteryCubit extends Cubit<MyBatteryState> {
  MyBatteryCubit() : super(MyBatteryDischarging());
  int batteryLevel = 0;
  void myBatteryListening(Battery battery) {
    battery.onBatteryStateChanged.listen((BatteryState state) async {
      batteryLevel = await battery.batteryLevel;
      if (state == BatteryState.charging) {
        emit(MyBatteryCharging());
      } else if (state == BatteryState.full) {
        emit(MyBatteryFull());
      } else {
        emit(MyBatteryDischarging());
      }
    });
  }
}
