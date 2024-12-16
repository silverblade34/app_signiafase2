import 'package:app_signiafase2/features/home/data/dtos/requestexit_dto.dart';
import 'package:app_signiafase2/features/home/data/repositories/home_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  RxString nameBase = "".obs;
  RxString nameUser = "".obs;
  RxInt selectedTabIndex = 0.obs;
  RxList<RequestExitDto> exitRequests = <RequestExitDto>[].obs;
  HomeRepository homeRepository = HomeRepository();

  @override
  void onInit() async {
    super.onInit();
    nameBase.value = box.read("nameBase");
    nameUser.value = box.read("nameUser");
    await getBaselistaesperaDay();
  }

  getBaselistaesperaDay() async {
    final baseId = box.read("idbase");
    final now = DateTime.now();
    final date = DateFormat('yyyyMMdd').format(now);
    final response = await homeRepository.getBaselistaesperaDay(baseId.toString(), date.toString());
    exitRequests.value = response;
  }
}
