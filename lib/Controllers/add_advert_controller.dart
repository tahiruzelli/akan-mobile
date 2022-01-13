import 'dart:io';
import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/models/advert_model.dart';
import 'package:akan_mobile/models/blood_types_model.dart';
import 'package:akan_mobile/models/cities_model.dart';
import 'package:akan_mobile/models/district_model.dart';
import 'package:akan_mobile/models/hospital_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddAdvertController extends GetxController {
  Fetch f = Fetch();
  TextEditingController detailController = TextEditingController();
  RxList<DistrictModel> districts = <DistrictModel>[].obs;
  RxList<CitiesModel> cities = <CitiesModel>[].obs;
  RxList<BloodTypesModel> bloodTypes = <BloodTypesModel>[].obs;
  RxList<HospitalModel> hospitals = <HospitalModel>[].obs;

  Rx<DistrictModel> selectedDistrict = DistrictModel.fromJson({}).obs;
  Rx<CitiesModel> selectedCity = CitiesModel.fromJson({}).obs;
  Rx<BloodTypesModel> selectedBloodtype = BloodTypesModel.fromJson({}).obs;
  Rx<HospitalModel> selectedHospital = HospitalModel.fromJson({}).obs;

  RxBool shoulReload = false.obs;
  var images = <File>[].obs;
  AdvertModel newAdvert;
  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));

  initiliazeVars() {
    selectedDistrict.value.name = 'Seçim Yapınız';
    selectedDistrict.value.id = 0;
    selectedDistrict.value.cityId = 0;
    selectedCity.value.name = 'Seçim Yapınız';
    selectedCity.value.id = 0;
    selectedBloodtype.value.type = 'Seçim Yapınız';
    selectedBloodtype.value.id = 0;
    selectedHospital.value.hospitalName = 'Seçim Yapınız';
    selectedHospital.value.id = 0;
  }

  Future<void> uploadImage() async {
    for (int i = 0; i < images.length; i++) {
      var uuid = const Uuid().v1();
      Reference ref = FirebaseStorage.instance.ref().child("post_$uuid.jpg");
      UploadTask uploadTask = ref.putFile(images[i]);
      (await uploadTask).ref.getDownloadURL().then((value) {
        f.postImage(url: value, advertId: newAdvert.id.toString());
      });
    }
  }

  void resetVars() {
    detailController.clear();
    districts.clear();
    shoulReload = false.obs;
    images.clear();
    newAdvert = AdvertModel.fromJson({});
    initiliazeVars();
  }

  getImage() async {
    List<XFile> image = await ImagePicker().pickMultiImage();
    if (image != null) {
      for (var i = 0; images.length < 3; i++) {
        images.add(File(image[i].path));
      }

      if ((image.length + images.length) > 3) {
        warningSnackBar("Uyarı", "En fazla 3 adet fotoğraf yükleyebilirsiniz!");
      } else {
        uploadImage();
      }
    }
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

  void getHospitals() {
    f.getHospitals().then((value) {
      hospitals.value =
          (value as List).map((e) => HospitalModel.fromJson(e)).toList();
    });
  }

  void getDistricts() {
    f.getDistricts(selectedCity.value.id.toString()).then((value) {
      districts.value =
          (value as List).map((e) => DistrictModel.fromJson(e)).toList();
    });
  }

  void createAdvert() {
    f
        .createAdvert(
      bloodType: selectedBloodtype.value.id.toString(),
      creatorID: myUser.id.toString(),
      hospitalID: selectedHospital.value.id.toString(),
      details: detailController.text,
    )
        .then((value) {
      if (value['success']) {
        Get.back();
        successSnackBar('Başarı', 'Ilanınız başarı ile oluşturuldu');
        newAdvert = AdvertModel.fromJson(value['data']['advert']);
        uploadImage();
      } else {
        warningSnackBar('Hata', value['error']);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initiliazeVars();
    getCities();
    getBloodTypes();
    getHospitals();
  }
}
