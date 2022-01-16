import 'package:akan_mobile/Controllers/proposal_controller.dart';
import 'package:akan_mobile/Views/Proposals/widgets/my_application_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDonorApplicationPage extends StatelessWidget {
  ProposalController proposalController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => proposalController.loading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : proposalController.myProposals.isEmpty
                ? const Center(
                    child: Text('Donorluk basvurunuz bulunmamaktadir,'),
                  )
                : ListView.builder(
                    itemCount: proposalController.myProposals.length,
                    itemBuilder: (context, index) {
                      return MyApplicationCard(proposalController.myProposals[index],proposalController.myUser);
                    },
                  ),
      ),
    );
  }
}
