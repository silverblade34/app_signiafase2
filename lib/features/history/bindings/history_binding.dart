import 'package:app_signiafase2/features/history/controllers/history_controller.dart';
import 'package:get/get.dart';

class HistoryBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HistoryController>(() => HistoryController());
  }
}