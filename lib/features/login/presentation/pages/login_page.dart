import 'package:app_signiafase2/config/constants/assets.dart';
import 'package:app_signiafase2/config/constants/colors.dart';
import 'package:app_signiafase2/features/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.only(
                top: screenHeight * 0.15, right: 30, left: 30, bottom: 50),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      AppAssets.loginImage,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Hola de nuevo!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromARGB(255, 63, 63, 63)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Ingrese sus credenciales",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Usuario"),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.username,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Contraseña"),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextField(
                            controller: controller.password,
                            obscureText: controller.obscurePass.value,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obscurePass.value =
                                      !controller.obscurePass.value;
                                },
                                child: Icon(
                                  controller.obscurePass.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            await controller.validateCredentials();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
