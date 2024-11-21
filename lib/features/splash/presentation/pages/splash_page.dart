import 'package:app_signiafase2/core/constants/assets.dart';
import 'package:app_signiafase2/features/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SplashController>(
        builder: (splashCntl) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.splashImage,
                  width: 250,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
