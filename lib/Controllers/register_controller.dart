import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/Views/Login/login_page.dart';
import 'package:akan_mobile/models/blood_types_model.dart';
import 'package:akan_mobile/models/cities_model.dart';
import 'package:akan_mobile/models/district_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Fetch f = Fetch();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  RxList<DistrictModel> districts = <DistrictModel>[].obs;
  RxList<CitiesModel> cities = <CitiesModel>[].obs;
  RxList<BloodTypesModel> bloodTypes = <BloodTypesModel>[].obs;

  Rx<DistrictModel> selectedDistrict = DistrictModel.fromJson({}).obs;
  Rx<CitiesModel> selectedCity = CitiesModel.fromJson({}).obs;
  Rx<BloodTypesModel> selectedBloodtype = BloodTypesModel.fromJson({}).obs;

  RxBool shoulReload = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initiliazeVars();
    getCities();
    getBloodTypes();
  }

  initiliazeVars() {
    selectedDistrict.value.name = 'Seçim Yapınız';
    selectedDistrict.value.id = 0;
    selectedDistrict.value.cityId = 0;
    selectedCity.value.name = 'Seçim Yapınız';
    selectedCity.value.id = 0;
    selectedBloodtype.value.type = 'Seçim Yapınız';
    selectedBloodtype.value.id = 0;
  }

  clearAllVars() {
    initiliazeVars();
    emailController.clear();
    fullnameController.clear();
    passwordController.clear();
    telephoneController.clear();
  }

  void getBloodTypes() {
    f.getBloodTypes().then((value) {
      bloodTypes.value =
          (value as List).map((e) => BloodTypesModel.fromJson(e)).toList();
    });
  }

  void getCities() {
    f.getCities().then((value) {
      cities.value =
          (value as List).map((e) => CitiesModel.fromJson(e)).toList();
    });
  }

  void getDistricts() {
    f.getDistricts(selectedCity.value.id.toString()).then((value) {
      districts.value =
          (value as List).map((e) => DistrictModel.fromJson(e)).toList();
    });
  }

  void onRegisterButtonPressed() {
    f
        .register(
      email: emailController.text,
      phone: telephoneController.text,
      password: passwordController.text,
      fullName: fullnameController.text,
      cityId: selectedCity.value.id.toString(),
      districtId: selectedDistrict.value.id.toString(),
      bloodType: selectedBloodtype.value.id.toString(),
      location: '',
      photoUrl: '',
    )
        .then((value) {
      if (value['success']) {
        successSnackBar('Başarı', 'Başarı ile kayıt oldunuz!');
        clearAllVars();
        Get.offAll(const LoginScreen());
      } else {
        errorSnackBar('Hata', value['error']);
      }
    });
  }
}
