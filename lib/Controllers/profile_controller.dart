

import 'package:akan_mobile/Views/Login/login_page.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController{
  UserModel myUser= UserModel.fromJson(GetStorage().read('UserData'));
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  exitApp(){
    GetStorage().remove('UserData');
    Get.offAll(const LoginScreen());
  }
}