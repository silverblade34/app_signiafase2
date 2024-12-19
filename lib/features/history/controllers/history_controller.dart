import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryController extends GetxController {
  RxString nameUser = "".obs;
  final box = GetStorage();
  final TextEditingController searchController = TextEditingController();
  final RxString selectedDate = ''.obs;
  final RxList<HistoryData> historyData = <HistoryData>[].obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      selectedDate.value =
          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
    }
  }

  void searchHistory() {
    // Implementar lógica de búsqueda
  }
  @override
  void onInit() async {
    super.onInit();
    nameUser.value = box.read("nameUser");
  }
}

class HistoryData {
  final String key;
  final String plate;
  final String creationDate;
  final String status;
  final String comment;

  HistoryData(
      {required this.key,
      required this.plate,
      required this.creationDate,
      required this.status,
      required this.comment});
}
