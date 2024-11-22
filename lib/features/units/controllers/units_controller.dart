import 'package:app_signiafase2/core/widgets/custom_alert.dart';
import 'package:app_signiafase2/core/widgets/snack_helper.dart';
import 'package:app_signiafase2/features/units/data/dtos/destino_dto.dart';
import 'package:app_signiafase2/features/units/data/repositories/units_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UnitsController extends GetxController {
  UnitsRepository unitsRepository = UnitsRepository();
  TextEditingController origen = TextEditingController();
  TextEditingController hojaRuta = TextEditingController();
  TextEditingController vehiculo = TextEditingController();
  TextEditingController nombreEmpresa = TextEditingController();
  TextEditingController cantidadBultos = TextEditingController();
  TextEditingController cantidadPaletasPlastico = TextEditingController();
  TextEditingController cantidadPaletasMadera = TextEditingController();
  TextEditingController nombreConductor = TextEditingController();
  TextEditingController telefonoConductor = TextEditingController();
  TextEditingController nombreAuxiliar1 = TextEditingController();
  TextEditingController nombreAuxiliar2 = TextEditingController();

  var selectedDestino = ''.obs;
  var listaDestino = <DestinoDto>[].obs;
  final box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    origen.text = box.read("nameBase");
    await getDestinos();
  }

  getDestinos() async {
    try {
      final response = await unitsRepository.getDestinos();
      listaDestino.value = response.data;
    } catch (e) {
      SnackHelper.showCustomAlert(e.toString(), AlertType.ERROR);
    }
  }
}
