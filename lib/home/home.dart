import 'package:battery_alarm/home/widgets/alarm_status_buttons.dart';
import 'package:battery_alarm/home/widgets/charging_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Battery Alarm"),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SizedBox(height: 20),
            const ChargingIndicator(),
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            const CustomAlarmStatusButtons()
          ]),
        ),
      ),
    );
  }
}
