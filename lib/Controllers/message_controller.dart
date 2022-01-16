import 'package:akan_mobile/Services/fetch.dart';
import 'package:akan_mobile/Views/Messages/message_detail.dart';
import 'package:akan_mobile/models/chat_room_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MessageController extends GetxController {
  Fetch f = Fetch();
  RxList<ChatRoomModel> chatRooms = <ChatRoomModel>[].obs;
  RxList<UserModel> users = <UserModel>[].obs;
  UserModel myUser = UserModel.fromJson(GetStorage().read('UserData'));
  RxBool loading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyMessageRooms();
  }

  getMyMessageRooms() async {
    chatRooms.clear();
    users.clear();
    loading.value = true;
    f.getMyChatRooms(id: myUser.id.toString()).then((value) async {
      chatRooms.value =
          (value as List).map((e) => ChatRoomModel.fromJson(e)).toList();
      for (int i = 0; i < chatRooms.length; i++) {
        if (myUser.id == chatRooms[i].receiverId) {
          var item = await f.getUserById(chatRooms[i].transmitterId.toString());

          users.add(UserModel.fromJson(item));
        } else {
          var item = await f.getUserById(chatRooms[i].receiverId.toString());

          users.add(UserModel.fromJson(item));
        }
      }
      loading.value = false;
    });
  }

  createChatRoom(String receiverId) {
    loading.value = true;
    String roomID;
    f
        .createChatRoom(
            receiverId: receiverId, transmitterId: myUser.id.toString())
        .then((value) {
      roomID = value['id'].toString();
      f.getUserById(receiverId).then((value) {
        loading.value = false;
        Get.to(
          MessageDetailPage(
            receiver: UserModel.fromJson(value),
            roomID: roomID,
          ),
        );
      });
    });
  }

  getChatRoomWithUser(String targetUserId) {
    String roomID;
    f
        .getChatRoomWithUser(
            myId: myUser.id.toString(), targetUserId: targetUserId)
        .then((value) {
      if (value['success']) {
        roomID = value['data']['chatRoom'][0]['id'].toString();
        f.getUserById(targetUserId).then((value) {
          loading.value = false;
          Get.to(
            MessageDetailPage(
              receiver: UserModel.fromJson(value),
              roomID: roomID,
            ),
          );
        });
      } else {
        createChatRoom(targetUserId);
      }
    });
  }
}
