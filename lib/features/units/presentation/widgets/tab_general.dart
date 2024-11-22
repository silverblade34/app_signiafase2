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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.blueLight,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
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
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.black,
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
                color: Colors.black,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedDestino.value.isEmpty
                    ? null
                    : controller.selectedDestino.value,
                hint: const Text(
                  "Seleccione el destino",
                  style: TextStyle(color: Colors.white),
                ),
                dropdownColor: Colors.black,
                items: controller.listaDestino.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.id.toString(),
                    child: Text(
                      "${item.ruc ?? ""} ${item.nombre}",
                      style: const TextStyle(color: Colors.white),
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
                  color: Colors.white,
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              fillColor: Colors.black,
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              fillColor: Colors.black,
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
              label: "Cantidad de Paletas (Madera)")
        ],
      ),
    );
  }
}
