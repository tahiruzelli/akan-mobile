import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/Adverts/advert_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApplicationCard extends StatelessWidget {
  int index;
  MyApplicationCard(this.index);
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
            Get.to(AdvertDetail());
          },
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C4D03AQFe883wZOzNDw/profile-displayphoto-shrink_200_200/0/1592940508582?e=1645056000&v=beta&t=n1uJWoEInQjpeP-Q3Mo_54pNcj4rTXCjK4kqX1GX-Zk'),
          ),
          title: const Text('Tahir Uzelli'),
          subtitle: const Text('AB+ son 2 gün acil kan'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('29.12.2021'),
              statusText(),
            ],
          ),
        ),
      ),
    );
  }

  Text statusText() {
    if (index % 3 == 0) {
      return Text(
        'Kabul Edildi',
        style: TextStyle(color: colorSuccess),
      );
    } else if (index % 3 == 1) {
      return Text(
        'Bekliyor',
        style: TextStyle(color: colorWarning),
      );
    } else if (index % 3 == 2) {
      return Text(
        'Reddedildi',
        style: TextStyle(color: colorDanger),
      );
    } else {
      return const Text('');
    }
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
