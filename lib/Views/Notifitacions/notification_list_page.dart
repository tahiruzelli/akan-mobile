import 'package:akan_mobile/Controllers/notification_controller.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:akan_mobile/Views/Notifitacions/widgets/notification_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationListPage extends StatelessWidget {
  NotificationController notificationController =
      Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    notificationController.notificationsSeen();
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(
        () => notificationController.notificationLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : notificationController.notifications.isEmpty
                ? const Center(
                    child: Text('Yeni bildiriminiz bulunmamaktadir.'),
                  )
                : ListView.builder(
                    itemCount: notificationController.notifications.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(index);
                    },
                  ),
      ),
    );
  }
}
