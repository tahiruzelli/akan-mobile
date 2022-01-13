import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/Views/Main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  Fetch f = Fetch();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void onLoginButtonPressed() {
    f.login(emailController.text, passwordController.text).then((value) {
      if (value['success']) {
        GetStorage().write('UserData', value['data']['user'][0]);
        print(value['data']['user'][0]);
        Get.offAll(MainPage());
      } else {
        errorSnackBar('Hata', value['error']);
      }
    });
  }
}
