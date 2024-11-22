import 'package:app_signiafase2/core/widgets/custom_alert.dart';
import 'package:app_signiafase2/core/widgets/loading_dialog.dart';
import 'package:app_signiafase2/core/widgets/snack_helper.dart';
import 'package:app_signiafase2/features/login/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepository();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
  final box = GetStorage();

  validateCredentials() async {
    if (username.text != "" && password.text != "") {
      try {
        Get.dialog(
          const LoadingDialog(message: "Cargando...", width: 250),
          barrierDismissible: false,
        );

        final response =
            await loginRepository.authLogin(username.text, password.text);
        box.write("nameUser", "${response.nombres} ${response.apellidos}");
        box.write("idbase", response.base.id);
        box.write("nameBase", response.base.nombre);
        box.write("username", response.usuario);
        box.write('isLogged', true);
        Get.back();
        Get.offAllNamed("/home");
      } catch (e) {
        final errorMessage = e.toString().replaceFirst('Exception: ', '');
        SnackHelper.showCustomAlert(errorMessage, AlertType.ERROR);
      }
    } else {
      SnackHelper.showCustomAlert(
          "Debe rellenar los campos necesarios", AlertType.WARNING);
    }
  }
}
