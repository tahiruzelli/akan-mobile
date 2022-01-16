import 'package:akan_mobile/Controllers/message_controller.dart';
import 'package:akan_mobile/Views/Messages/widgets/message_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesList extends StatelessWidget {
  MessageController messageController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    messageController.getMyMessageRooms();
    return Scaffold(
      body: Obx(
        () => messageController.loading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : messageController.chatRooms.isEmpty
                ? const Center(
                    child: Text('Mesajiniz bulunmamaktadir.'),
                  )
                : ListView.builder(
                    itemCount: messageController.chatRooms.length,
                    itemBuilder: (context, index) {
                      return MessageListCard(messageController.chatRooms[index],messageController.users[index]);
                    },
                  ),
      ),
    );
  }
}
