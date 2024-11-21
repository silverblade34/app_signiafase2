import 'dart:async';

import 'package:app_signiafase2/routes/pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(Routes.login),
    );
  }
}
