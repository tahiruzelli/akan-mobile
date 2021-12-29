import 'package:akan_mobile/Views/Notifitacions/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return NotificationCard(index);
        },
      ),
    );
  }
}
