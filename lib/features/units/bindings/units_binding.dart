import 'package:app_signiafase2/features/units/controllers/units_controller.dart';
import 'package:get/get.dart';

class UnitsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<UnitsController>(() => UnitsController());
  }
}