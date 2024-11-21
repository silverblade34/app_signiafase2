import 'package:app_signiafase2/features/login/bindings/login_binding.dart';
import 'package:app_signiafase2/features/login/presentation/pages/login_page.dart';
import 'package:app_signiafase2/features/splash/bindings/splash_binding.dart';
import 'package:app_signiafase2/features/splash/presentation/pages/splash_page.dart';

import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
