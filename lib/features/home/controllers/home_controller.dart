import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  RxString nameBase = "".obs;
  RxString nameUser = "".obs;
  @override
  void onInit() {
    super.onInit();
    nameBase.value = box.read("nameBase");
    nameUser.value = box.read("nameUser");
  }
}
