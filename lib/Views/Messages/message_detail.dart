import 'package:akan_mobile/Controllers/message_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDetailPage extends StatefulWidget {
  UserModel receiver;
  String roomID;
  MessageDetailPage({this.receiver, this.roomID});
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessageDetailPage> {
  MessageController messageController = Get.find();
  DatabaseReference messagesRef;
  List messageList = [];
  List list = [];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();
  void _toggleSendChannelMessage(String text) async {
    String text = textEditingController.text;
    if (text.isEmpty) {
      return;
    }
    try {
      DateTime now = DateTime.now();
      messagesRef.child(widget.roomID).push().set({
        'message': textEditingController.text,
        'sender_date': now.toString().split('.')[0],
        'sender_nickname': messageController.myUser.fullName,
        'sender_id': messageController.myUser.id.toString(),
      });
      textEditingController.clear();
    } catch (errorCode) {
      print(errorCode);
    }
  }

  Widget _messageList() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 1,
        child: SizedBox(
          child: ListView.builder(
            reverse: true,
            itemCount: messageList.length,
            itemBuilder: (BuildContext context, int index) {
              if (messageList.isEmpty) {
                return null;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: messageList[index]['sender_id'] ==
                          messageController.myUser.id.toString()
                      ? ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          trailing: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                            child: Center(
                              child: Text(
                                widget.receiver.fullName[0].toUpperCase(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Text(
                              messageList[index]['message'].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        )
                      : ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                            child: Center(
                              child: Text(
                                widget.receiver.fullName[0].toUpperCase(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Text(
                              messageList[index]['message'].toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    messagesRef = FirebaseDatabase.instance.ref();
    return Scaffold(
      appBar: buildAppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.9,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: StreamBuilder(
                  stream: messagesRef.child(widget.roomID).onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      list.clear();
                      messageList.clear();
                      list.add(snapshot.data.snapshot);
                      if (list[0].value != null) {
                        Map<dynamic, dynamic> values = list[0].value;
                        values.forEach((key, values) {
                          messageList.add(values);
                        });

                        messageList.sort((a, b) =>
                            b['sender_date'].compareTo(a['sender_date']));
                      } else {
                        messageList = [];
                      }
                      return _messageList();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            _textFieldBox(),
          ],
        ),
      ),
    );
  }

  _textFieldBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFFF6F6F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                cursorHeight: 14,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide:
                          const BorderSide(color: Color(0XFFE4E4E5), width: 1)),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide:
                          const BorderSide(color: Color(0XFFE4E4E5), width: 1)),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _toggleSendChannelMessage(textEditingController.text);
              },
              icon: const Icon(
                Icons.send,
                color: Color(0XFF057CFE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
