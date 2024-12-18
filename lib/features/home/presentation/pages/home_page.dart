import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/core/widgets/slidebar.dart';
import 'package:app_signiafase2/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Obx(
        () => slidebarDrawer(nameConductor: controller.nameUser.value),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Bienvenido de nuevo!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Obx(
                        () => Text(
                          controller.nameUser.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Builder(
            builder: (context) => Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ),
          ),
          // Menu icon
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Solicitudes de salida del día",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Obx(
                      () => Expanded(
                        child: ListView.separated(
                          itemCount: controller.exitRequests.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            final request = controller.exitRequests[index];
                            return ListTile(
                              leading: const Icon(Icons.local_shipping,
                                  color: Colors.grey),
                              title: Text("Placa: ${request.placa}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Clave: ${request.clavesalida.toString()}"),
                                  Text(
                                      "Fecha: ${request.fechacierre.toString()}"),
                                  Text(
                                      "Comentario: ${request.comentarios.toString()}"),
                                ],
                              ),
                              trailing: Text(
                                request.estado.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: request.estado == "Denegado"
                                      ? Colors.red
                                      : request.estado == "Autorizado"
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 224, 206, 4),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
