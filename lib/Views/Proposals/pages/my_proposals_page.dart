import 'package:akan_mobile/Controllers/proposal_controller.dart';
import 'package:akan_mobile/Views/Proposals/widgets/my_advert_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProposalsPage extends StatelessWidget {
  ProposalController proposalController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => proposalController.loading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : proposalController.myAdverts.isEmpty
                ? const Center(child: Text('Ilaniniz bulunmamaktadir.'))
                : ListView.builder(
                    itemCount: proposalController.myAdverts.length,
                    itemBuilder: (context, index) {
                      return MyAdvertCard(index,proposalController.myAdverts[index],proposalController.myUser);
                    },
                  ),
      ),
    );
  }
}
