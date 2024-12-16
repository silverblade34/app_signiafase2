import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/core/widgets/drawer_body.dart';
import 'package:flutter/material.dart';

Drawer slidebarDrawer(
    {required String nameConductor}) {
  return Drawer(
    width: 260,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                nameConductor,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const DrawerBodyWidget()
      ],
    ),
  );
}