import 'dart:io';

import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/Views/Login/login_page.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProfileController extends GetxController {
  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));
  Fetch f = Fetch();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  exitApp() {
    GetStorage().remove('UserData');
    Get.offAll(const LoginScreen());
  }

  changeProfilPhoto() {
    getImage();
  }

  Future<void> uploadImage(File file) async {
    var uuid = const Uuid().v1();
    Reference ref = FirebaseStorage.instance.ref().child("post_$uuid.jpg");
    UploadTask uploadTask = ref.putFile(file);
    (await uploadTask).ref.getDownloadURL().then((fileUrl) {
      f
          .changeProfilePhoto(userId: myUser.id.toString(), photoUrl: fileUrl)
          .then((value) {
        if (value['success']) {
          successSnackBar(
              'Bilgi', 'Basariyla profil fotografini degistirdiniz');
          Map tmp = GetStorage().read('UserData');
          tmp['photoUrl'] = fileUrl;
          GetStorage().write('UserData', tmp);
        } else {
          errorSnackBar('Hata', value['error']);
        }
      });
    });
  }

  getImage() async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      uploadImage(File(image.path));
    }
  }
}
