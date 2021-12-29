import 'package:akan_mobile/Views/Messages/widgets/message_list_card.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MessageListCard(index);
        },
      ),
    );
  }
}
