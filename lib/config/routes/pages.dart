import 'package:app_signiafase2/core/middleware/auth_middleware.dart';
import 'package:app_signiafase2/features/home/bindings/home_binding.dart';
import 'package:app_signiafase2/features/home/presentation/pages/home_page.dart';
import 'package:app_signiafase2/features/login/bindings/login_binding.dart';
import 'package:app_signiafase2/features/login/presentation/pages/login_page.dart';
import 'package:app_signiafase2/features/splash/bindings/splash_binding.dart';
import 'package:app_signiafase2/features/splash/presentation/pages/splash_page.dart';
import 'package:app_signiafase2/features/units/bindings/units_binding.dart';
import 'package:app_signiafase2/features/units/presentation/pages/units_page.dart';

import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.units,
      page: () => const UnitsPage(),
      binding: UnitsBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
