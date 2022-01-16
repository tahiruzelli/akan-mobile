import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/Views/Adverts/advert_detail.dart';
import 'package:akan_mobile/models/advert_detail_model.dart';
import 'package:akan_mobile/models/all_advert_model.dart';
import 'package:akan_mobile/models/proposal_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdvertController extends GetxController {
  Fetch f = Fetch();
  RxList<AllAdvertModel> adverts = <AllAdvertModel>[].obs;
  RxList<ProposalModel> proposals = <ProposalModel>[].obs;

  AllAdvertModel choosenAdvert;
  AdvertDetailModel advertDetail;

  RxBool advertsLoading = false.obs;
  RxBool beDonorLoading = false.obs;

  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAdverts();
  }

  getMyAdvertProposals(String advertId) {
    f.getAdvertProposals(advertId: advertId).then((value) {
      proposals.value =
          (value as List).map((e) => ProposalModel.fromJson(e)).toList();
      advertsLoading.value = false;
    });
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

  getAdvertDetail(String advertId) {
    advertsLoading.value = true;
    f.getAdvertDetail(advertId).then((value) {
      advertDetail = AdvertDetailModel.fromJson(value);

      getMyAdvertProposals(advertDetail.advert.id.toString());
    });
  }

  onAdvertCardPressed(AllAdvertModel advert) {
    choosenAdvert = advert;
    Get.to(AdvertDetail());
    getAdvertDetail(advert.advertID.toString());
  }
}
