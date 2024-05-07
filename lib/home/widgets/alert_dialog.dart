import 'package:battery_alarm/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Lottie.asset("assets/lottie/alarm.json", height: 100),
      ),
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red, foregroundColor: Colors.white),
          child: const Text("STOP"),
        )
      ],
    );
  }
}
