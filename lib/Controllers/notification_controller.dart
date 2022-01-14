import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController{
  Fetch f =Fetch();
  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));
  var notifications = [].obs;
  RxBool notificationLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();getNotifications();

  }
  getNotifications(){
    notificationLoading.value=true;
        f.getNotifications(id: myUser.id.toString()).then((value) {
notifications.value = value;
notificationLoading.value =false;
    });
  }
  notificationsSeen(){
    f.notificationSeen(id: myUser.id.toString());
  }
}