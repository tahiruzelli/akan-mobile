import 'dart:io';

import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAdvertController extends GetxController {
  var images = <File>[].obs;
  List dropDownList = [
    'istanbul',
    'ankara',
    'izmir',
  ];
  RxString dropDownName = 'istanbul'.obs;
  getImage() async {
    List<XFile> image = await ImagePicker().pickMultiImage();
    if (image != null) {
      for (var i = 0; images.length < 10; i++) {
        images.add(File(image[i].path));
      }
      if ((image.length + images.length) > 10) {
        warningSnackBar(
            "Uyarı", "En fazla 10 adet fotoğraf yükleyebilirsiniz!");
      }
    }
  }

  void createAdvert() {
    Get.back();
    successSnackBar('Başarı', 'Ilanınız başarı ile oluşturuldu');
  }
}
