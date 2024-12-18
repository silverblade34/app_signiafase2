import 'package:app_signiafase2/config/constants/fonts.dart';
import 'package:app_signiafase2/features/units/controllers/units_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabResguardo extends StatelessWidget {
  final UnitsController controller;
  const TabResguardo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos de resguardo",
            style: AppFonts.titleForm,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Empresa de resguardo",
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
                  "Seleccione la empresa resguardo",
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
        ],
      ),
    );
  }
}
