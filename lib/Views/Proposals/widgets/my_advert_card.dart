import 'package:akan_mobile/Controllers/advert_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/Proposals/pages/my_advert_detail.dart';
import 'package:akan_mobile/models/advert_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAdvertCard extends StatelessWidget {
  int index;
  AdvertModel advert;
  UserModel myUser;
  MyAdvertCard(this.index, this.advert, this.myUser);
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
            AdvertController advertController = Get.put(AdvertController());
            advertController.getAdvertDetail(advert.id.toString());
            Get.to(MyAdvertDetail());
          },
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(myUser.photoUrl),
          ),
          title: Text(myUser.fullName),
          subtitle: Text(advert.details),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(advert.creationTime.split('T')[0]),
              advert.isActive
                  ? Text(
                      'Aktif',
                      style: TextStyle(color: colorSuccess),
                    )
                  : Text(
                      'Aktif Değil',
                      style: TextStyle(color: colorDanger),
                    )
            ],
          ),
        ),
      ),
    );
  }

  _onLongPressed(context) {
    return showCupertinoModalPopup(
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
                "Kaldır",
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
