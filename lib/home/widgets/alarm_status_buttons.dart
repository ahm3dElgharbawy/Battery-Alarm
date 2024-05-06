import 'package:battery_alarm/cubits/alarm_cubit/battery_alarm_cubit.dart';
import 'package:battery_alarm/home/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAlarmStatusButtons extends StatelessWidget {
  const CustomAlarmStatusButtons({super.key});
  @override
  Widget build(BuildContext context) {
    final alarmManager = context.read<BatteryAlarmCubit>();
    return BlocConsumer<BatteryAlarmCubit, BatteryAlarmState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButtonWithIcon(
                title: "Alarm Enabled",
                color: Colors.deepPurpleAccent,
                icon: Icons.alarm_rounded,
                onPressed: () {
                  // context.read<MyBatteryCubit>().add(MyBatteryListeningEvent(battery: Battery()));
                  alarmManager.enableAlarm();
                },
                active: state is BatteryAlarmEnabledState,
              ),
              CustomElevatedButtonWithIcon(
                title: "Alarm Disabled",
                color: const Color(0xfff44336),
                icon: Icons.alarm_off_rounded,
                onPressed: () {
                  alarmManager.disableAlarm();
                },
                active: state is BatteryAlarmDisabledState,
              ),
            ],
          ),
        );
      },
    );
  }
}
