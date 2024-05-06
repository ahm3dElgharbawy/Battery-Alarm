import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

part 'battery_alarm_state.dart';

class BatteryAlarmCubit extends Cubit<BatteryAlarmState> {
  BatteryAlarmCubit() : super(BatteryAlarmEnabledState());
  bool alarmEnabled = true; // When the battery get full, the alarm will launch or not
  bool isAlarmRunning = false; // Ringtone is running now or not
  enableAlarm() {
    alarmEnabled = true;
    emit(BatteryAlarmEnabledState());
  }

  disableAlarm() {
    alarmEnabled = false;
    stopAlarm();
    emit(BatteryAlarmDisabledState());
  }

  launchAlarm() {
    if (alarmEnabled && !isAlarmRunning) {
      isAlarmRunning = true;
      FlutterRingtonePlayer.play(
        android: AndroidSounds.alarm,
        ios: IosSounds.alarm,
        looping: true,
        volume: 0.1,
        asAlarm: false,
      );
    }
  }

  stopAlarm() {
    if (isAlarmRunning) {
      isAlarmRunning = false;
      FlutterRingtonePlayer.stop();
    }
  }
}
