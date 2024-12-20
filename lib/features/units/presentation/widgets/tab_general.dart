import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/config/constants/fonts.dart';
import 'package:app_signiafase2/features/units/controllers/units_controller.dart';
import 'package:app_signiafase2/features/units/presentation/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabGeneral extends StatelessWidget {
  final UnitsController controller;
  const TabGeneral({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Precintos",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(4),
            height: 53,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(() => Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: controller.items.map((item) {
                          return Chip(
                            label: Text(
                              item,
                              style:
                                  TextStyle(fontSize: 12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4),
                            backgroundColor:
                                const Color.fromARGB(255, 204, 230, 251),
                          );
                        }).toList(),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      showAddItemDialog();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Origen",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.origen,
            readOnly: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Destino",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedDestino.value.isEmpty
                    ? null
                    : controller.selectedDestino.value,
                hint: const Text(
                  "Seleccione el destino",
                ),
                items: controller.listaDestino.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.id.toString(),
                    child: Text(
                      "${item.ruc ?? ""} ${item.nombre}",
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedDestino.value = value;
                  }
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 81, 81, 81),
                ),
                underline: const SizedBox(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Hoja de ruta",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.hojaRuta,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              suffixIcon: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Vehiculo",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.vehiculo,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              suffixIcon: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          FormFieldSalida(
              value: controller.nombreEmpresa,
              label: "Nombre empresa transporte"),
          FormFieldSalida(
              value: controller.cantidadBultos, label: "Cantidad de bultos"),
          FormFieldSalida(
              value: controller.cantidadPaletasPlastico,
              label: "Cantidad de Paletas (Plástico)"),
          FormFieldSalida(
              value: controller.cantidadPaletasPlastico,
              label: "Cantidad de Paletas (Madera)"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Tipo de documento",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedTipoDocumentoConductor.value.isEmpty
                    ? null
                    : controller.selectedTipoDocumentoConductor.value,
                hint: const Text(
                  "Seleccione el tipo de documento",
                ),
                items: controller.listaTipoDocumento.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.id.toString(),
                    child: Text(
                      item.nombre,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTipoDocumentoConductor.value = value;
                  }
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 81, 81, 81),
                ),
                underline: const SizedBox(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Conductor",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.conductor,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              suffixIcon: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          FormFieldSalida(
              value: controller.nombreConductor, label: "Nombre conductor"),
          FormFieldSalida(
              value: controller.telefonoConductor, label: "Teléfono conductor"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Tipo de documento auxiliar 01",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedTipoDocumentoAuxiliar1.value.isEmpty
                    ? null
                    : controller.selectedTipoDocumentoAuxiliar1.value,
                hint: const Text(
                  "Seleccione el tipo de documento",
                ),
                items: controller.listaTipoDocumento.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.id.toString(),
                    child: Text(
                      item.nombre,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTipoDocumentoAuxiliar1.value = value;
                  }
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 81, 81, 81),
                ),
                underline: const SizedBox(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Auxiliar 01",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.auxiliar1,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              suffixIcon: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          FormFieldSalida(
              value: controller.nombreAuxiliar1, label: "Nombre Auxiliar 01"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Tipo de documento auxiliar 02",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedTipoDocumentoAuxiliar2.value.isEmpty
                    ? null
                    : controller.selectedTipoDocumentoAuxiliar2.value,
                hint: const Text(
                  "Seleccione el tipo de documento",
                ),
                items: controller.listaTipoDocumento.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.id.toString(),
                    child: Text(
                      item.nombre,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTipoDocumentoAuxiliar2.value = value;
                  }
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 81, 81, 81),
                ),
                underline: const SizedBox(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Auxiliar 02",
            style: AppFonts.labelForm,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller.auxiliar2,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              suffixIcon: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          FormFieldSalida(
              value: controller.nombreAuxiliar2, label: "Nombre Auxiliar 02"),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Enviar solicitud",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void showAddItemDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          "Agregar o eliminar items",
          style: TextStyle(fontSize: 17),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.itemController,
                    decoration:
                        const InputDecoration(hintText: "Ingrese un item"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    if (controller.itemController.text.isNotEmpty) {
                      controller.items.add(controller.itemController.text);
                      controller.itemController
                          .clear(); // Limpia el campo de texto
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Mostrar los items en un Column
            Obx(() => Column(
                  children: controller.items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(item),
                        trailing: InkWell(
                          child: Container(
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                          onTap: () => {controller.items.removeAt(index)},
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(); // Cierra el diálogo
            },
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }
}
