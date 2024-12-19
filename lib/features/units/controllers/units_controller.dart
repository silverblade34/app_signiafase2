import 'package:app_signiafase2/core/widgets/custom_alert.dart';
import 'package:app_signiafase2/core/widgets/snack_helper.dart';
import 'package:app_signiafase2/features/units/data/dtos/destino_dto.dart';
import 'package:app_signiafase2/features/units/data/dtos/tipodocumento_dto.dart';
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
  TextEditingController conductor = TextEditingController();
  TextEditingController nombreConductor = TextEditingController();
  TextEditingController telefonoConductor = TextEditingController();
  TextEditingController auxiliar1 = TextEditingController();
  TextEditingController nombreAuxiliar1 = TextEditingController();
  TextEditingController auxiliar2 = TextEditingController();
  TextEditingController nombreAuxiliar2 = TextEditingController();
  RxString nameUser = "".obs;
  var selectedDestino = ''.obs;
  var listaDestino = <DestinoDto>[].obs;
  var selectedTipoDocumentoConductor = ''.obs;
  var selectedTipoDocumentoAuxiliar1 = ''.obs;
  var selectedTipoDocumentoAuxiliar2 = ''.obs;
  var listaTipoDocumento = <TipoDocumentoDto>[].obs;
  final box = GetStorage();
  var items = <String>[].obs;
  TextEditingController itemController = TextEditingController();

  void addItem(String item) {
    if (item.isNotEmpty) {
      items.add(item);
      itemController.clear();
    }
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  @override
  void onInit() async {
    super.onInit();
    origen.text = box.read("nameBase");
    nameUser.value = box.read("nameUser");
    await Future.wait([
      getDestinos(),
      getTipoDocumentos(),
    ]);
  }

  Future<void> getDestinos() async {
    try {
      final response = await unitsRepository.getDestinos();
      listaDestino.value = response.data;
    } catch (e) {
      SnackHelper.showCustomAlert(e.toString(), AlertType.ERROR);
    }
  }

  Future<void> getTipoDocumentos() async {
    try {
      final response = await unitsRepository.getTipoDocumentos();
      listaTipoDocumento.value = response.data;
    } catch (e) {
      SnackHelper.showCustomAlert(e.toString(), AlertType.ERROR);
    }
  }

  
}
