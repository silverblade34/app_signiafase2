import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/config/constants/fonts.dart';
import 'package:app_signiafase2/features/units/controllers/units_controller.dart';
import 'package:flutter/material.dart';

class TabResguardo extends StatelessWidget {
  final UnitsController controller;
  const TabResguardo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PRUEBA")
        ],
      ),
    );
  }
}
