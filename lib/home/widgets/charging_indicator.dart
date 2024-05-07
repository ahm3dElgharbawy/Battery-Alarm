import 'package:battery_alarm/core/constants/colors.dart';
import 'package:battery_alarm/cubits/alarm_cubit/battery_alarm_cubit.dart';
import 'package:battery_alarm/cubits/battery_cubit/my_battery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChargingIndicator extends StatelessWidget {
  const ChargingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBatteryCubit>();
    return BlocConsumer<MyBatteryCubit, MyBatteryState>(
      listener: (context, state) {
        if (state is MyBatteryFull) {
          context.read<BatteryAlarmCubit>().launchAlarm(context);
        }
      },
      builder: (context, state) => SizedBox(
        height: 200,
        // color: Colors.grey,
        child: Stack(
          children: [
            Center(
              child: Transform.scale(
                scale: 5,
                child: Transform.flip(
                  flipX: true,
                  child: CircularProgressIndicator(
                    value: state is MyBatteryFull ? 1 : bloc.batteryLevel / 100,
                    backgroundColor: const Color(0xffF0EDFF),
                    color: state is MyBatteryCharging
                        ? AppColors.primary
                        : (state is MyBatteryFull)
                            ? AppColors.green
                            : AppColors.red,
                    strokeWidth: 2,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(bloc.batteryLevel.toString(),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (state is MyBatteryCharging)
                    const Icon(Icons.electric_bolt_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
