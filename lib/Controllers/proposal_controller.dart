import 'package:akan_mobile/Controllers/message_controller.dart';
import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/models/advert_model.dart';
import 'package:akan_mobile/models/proposal_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProposalController extends GetxController {
  Fetch f = Fetch();
  RxList<AdvertModel> myAdverts = <AdvertModel>[].obs;
  RxList<ProposalModel> myProposals = <ProposalModel>[].obs;

  RxBool loading = false.obs;

  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getMyAdverts() {
    loading.value = true;
    f.getMyAdverts(myID: myUser.id.toString()).then((value) {
      myAdverts.value =
          (value as List).map((e) => AdvertModel.fromJson(e)).toList();
      loading.value = false;
    });
  }

  acceptProposal({@required String proposalId, @required String targetUserId}) {
    f.acceptProposal(proposalId).then((value) {
      if (value['success']) {
        successSnackBar('Basari',
            'Basari ile teklifi kabul ettiniz. Mesaj sayfasina yonlendiriliyorsunuz');
        MessageController messageController = Get.put(MessageController());
        messageController.getChatRoomWithUser(targetUserId);
      } else {
        warningSnackBar('Uyari', value['error']);
      }
    });
  }

  getMyProposals() {
    loading.value = true;
    f.getMyProposals(myID: myUser.id.toString()).then((value) {
      myProposals.value =
          (value as List).map((e) => ProposalModel.fromJson(e)).toList();
      loading.value = false;
    });
  }
}
