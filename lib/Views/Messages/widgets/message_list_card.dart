import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/Messages/message_detail.dart';
import 'package:akan_mobile/models/chat_room_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageListCard extends StatelessWidget {
  ChatRoomModel chatRoom;
  UserModel user;
  MessageListCard(this.chatRoom, this.user);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        child: ListTile(
          onLongPress: () {
            _onLongPressed(context);
          },
          onTap: () {
            Get.to(
              MessageDetailPage(
                receiver: user,
                roomID: chatRoom.id.toString(),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(user.photoUrl),
          ),
          title: Text(user.fullName),
          trailing: _trailing(),
        ),
      ),
    );
  }

  _trailing() {
    return Text(
      '17.04',
      style: TextStyle(
        color: colorRed,
        fontSize: 10,
      ),
    );
  }

  _onLongPressed(context) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "İptal",
              style: TextStyle(color: Colors.red),
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Mesajı Sil",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Okundu Olarak İşaretle",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Detayına Git",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Şikayet Et",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
