import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageListCard extends StatelessWidget {
  int index;
  MessageListCard(this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        child: ListTile(
          onLongPress: () {
            _onLongPressed(context);
          },
          onTap: () {},
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C4D03AQFe883wZOzNDw/profile-displayphoto-shrink_200_200/0/1592940508582?e=1645056000&v=beta&t=n1uJWoEInQjpeP-Q3Mo_54pNcj4rTXCjK4kqX1GX-Zk'),
          ),
          title: const Text('Tahir Uzelli'),
          subtitle: const Text('Evet ihtiyacımız hala devam ediyor'),
          trailing: _trailing(),
        ),
      ),
    );
  }

  _trailing() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '17.04',
          style: TextStyle(
            color: index % 2 == 0 ? colorRed : Colors.black,
            fontSize: 10,
          ),
        ),
        index % 2 == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        colorRed,
                        Colors.redAccent,
                        colorRed,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ],
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
