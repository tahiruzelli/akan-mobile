import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AdvertCard extends StatelessWidget {
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
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C4D03AQFe883wZOzNDw/profile-displayphoto-shrink_200_200/0/1592940508582?e=1645056000&v=beta&t=n1uJWoEInQjpeP-Q3Mo_54pNcj4rTXCjK4kqX1GX-Zk'),
          ),
          title: Text('Tahir Uzelli'),
          subtitle: Text('AB+ son 2 gün acil kan'),
          trailing: Text('29.12.2021'),
        ),
      ),
    );
  }
}
