import 'package:app_signiafase2/config/theme.dart';
import 'package:app_signiafase2/routes/pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WakelockPlus.enable();
  runApp(GetMaterialApp(
    title: "appSigniaFase2",
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.splash,
    theme: AppTheme.lightTheme,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
