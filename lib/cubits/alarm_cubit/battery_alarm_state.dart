part of 'battery_alarm_cubit.dart';

@immutable
sealed class BatteryAlarmState {}

final class BatteryAlarmEnabledState extends BatteryAlarmState {}
final class BatteryAlarmDisabledState extends BatteryAlarmState {}


