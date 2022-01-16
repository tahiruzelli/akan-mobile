import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/Adverts/advert_detail.dart';
import 'package:akan_mobile/models/proposal_model.dart';
import 'package:akan_mobile/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApplicationCard extends StatelessWidget {
  ProposalModel proposal;
  UserModel myUser;
  MyApplicationCard(this.proposal,this.myUser);
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
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(myUser.photoUrl),
          ),
          title: Text(myUser.fullName),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(proposal.proposalCreationTime.split('T')[0]),
              statusText(),
            ],
          ),
        ),
      ),
    );
  }

  Text statusText() {
    if (proposal.isProposalAccepted) {
      return Text(
        'Kabul Edildi',
        style: TextStyle(color: colorSuccess),
      );
    } else if (!proposal.isProposalAccepted) {
      return Text(
        'Bekliyor',
        style: TextStyle(color: colorWarning),
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
