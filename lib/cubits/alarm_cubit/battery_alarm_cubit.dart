import 'package:battery_alarm/home/widgets/alert_dialog.dart';
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

  launchAlarm(BuildContext context) {
    if (alarmEnabled && !isAlarmRunning) {
      isAlarmRunning = true;
      FlutterRingtonePlayer.play(
        android: AndroidSounds.ringtone,
        ios: IosSounds.alarm,
        looping: true,
        volume: 0.1,
        asAlarm: false,
      );
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CustomAlertDialog(
          onTap: () {
            stopAlarm();
            disableAlarm();
            Navigator.pop(context);
          },
        ),
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
