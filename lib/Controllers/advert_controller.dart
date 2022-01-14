import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/Views/Adverts/advert_detail.dart';
import 'package:akan_mobile/models/all_advert_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdvertController extends GetxController {
  Fetch f = Fetch();
  RxList<AllAdvertModel> adverts = <AllAdvertModel>[].obs;
  AllAdvertModel choosenAdvert;
  RxBool advertsLoading = false.obs;
  RxBool advertOwnerLoading = false.obs;
  RxBool advertHostpitalLoading = false.obs;
  RxBool beDonorLoading = false.obs;
  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAdverts();
  }

  onDonorOlButtonPressed() {
    beDonorLoading.value = true;
    f
        .beDonor(
            transmitterID: myUser.id.toString(),
            advertId: choosenAdvert.advertID.toString())
        .then((value) {
      beDonorLoading.value = false;
      if (value['success']) {
        Get.back();
        successSnackBar(
            'Başarılı', 'Başarı ile donör olma talebiniz iletildi!');
      } else {
        errorSnackBar('Hata', value['error']);
      }
    });
  }

  getAllAdverts() {
    f.getAdverts().then((value) {
      advertsLoading.value = true;
      adverts.value =
          (value as List).map((e) => AllAdvertModel.fromJson(e)).toList();

      advertsLoading.value = false;
    });
  }

  getAdvertDetail() {}

  onAdvertCardPressed(AllAdvertModel advert) {
    choosenAdvert = advert;
    Get.to(AdvertDetail());
    getAdvertDetail();
  }
}
