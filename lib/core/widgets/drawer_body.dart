import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/core/dtos/menuoptions_dto.dart';
import 'package:app_signiafase2/core/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerBodyWidget extends StatelessWidget {
  const DrawerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final GetStorage storage = GetStorage();

    // Datos del menú
    dynamic storedData = [
      {"title": "Home", "route": "/home", "key": "home"},
      {"title": "Registro", "route": "/units", "key": "units"},
      {"title": "Historial", "route": "/record", "key": "record"},
      {"title": "Cerrar sesión", "route": "/logout", "key": null}
    ];

    // Definir íconos para cada opción de menú
    final List<IconData> allIcons = [
      Icons.local_shipping_outlined, // Abastecer
      Icons.description, // Tickets
      Icons.route_outlined, // Guías
      Icons.exit_to_app, // Cerrar sesión
    ];

    List<MenuOptions> menuOptions = storedData
        .map<MenuOptions>((item) => MenuOptions(
              title: item['title'],
              route: item['route'],
            ))
        .toList();

    String? selectedView = storage.read<String>('selectedView');

    return Container(
      height: screenHeight - 110,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            menuOptions.length,
            (index) {
              final isLastItem = index == menuOptions.length - 1;
              final isSelected = selectedView == menuOptions[index].route;

              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: isLastItem
                        ? BorderSide.none
                        : BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                  color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                ),
                child: Stack(
                  children: [
                    ListTile(
                      leading: Icon(allIcons[index], color: AppColors.darkGrey),
                      title: Text(
                        menuOptions[index].title,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pop(context);

                        if (menuOptions[index].route == "/logout") {
                          Get.dialog(
                            AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              title: const Text(
                                'Cerrar sesión',
                                style: TextStyle(fontSize: 21),
                              ),
                              content: const Text(
                                '¿Desea salir de la aplicación?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('NO'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Get.dialog(
                                      const LoadingDialog(
                                          message: "Cargando...", width: 250),
                                      barrierDismissible: false,
                                    );
                                    Get.back();
                                    GetStorage().erase();
                                    Get.back();
                                    Get.offAllNamed('/login');
                                  },
                                  child: const Text('SI'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Guardar la vista seleccionada en GetStorage
                          storage.write(
                              'selectedView', menuOptions[index].route);
                          Get.offAllNamed(menuOptions[index].route);
                        }
                      },
                    ),
                    // Barra de color en el extremo derecho si está seleccionada
                    if (isSelected)
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 5,
                          color: Colors.blue, // Color de la barra
                        ),
                      ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
