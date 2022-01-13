import 'package:akan_mobile/Controllers/advert_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/Adverts/advert_detail.dart';
import 'package:akan_mobile/models/advert_model.dart';
import 'package:akan_mobile/models/all_advert_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertCard extends StatelessWidget {
  AdvertController advertController = Get.find();
  AllAdvertModel advert;
  AdvertCard(this.advert);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        child: ListTile(
          onLongPress: () {
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
          },
          onTap: () {
            advertController.onAdvertCardPressed(advert);
          },
          leading: CircleAvatar(
            backgroundColor: colorWhite,
            backgroundImage: NetworkImage(advert.advertCreatorPhoto),
          ),
          title: Text(advert.advertCreatorName),
          subtitle: Text(advert.advertDetail),
          trailing: Text(advert.advertCreationTime),
        ),
      ),
    );
  }
}
