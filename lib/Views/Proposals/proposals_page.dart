import 'package:akan_mobile/Controllers/proposal_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/Notifitacions/notification_list_page.dart';
import 'package:akan_mobile/Views/Proposals/pages/my_donor_applications_page.dart';
import 'package:akan_mobile/Views/Proposals/pages/my_proposals_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposalsPage extends StatefulWidget {
  @override
  _ProposalsPage createState() => _ProposalsPage();
}

class _ProposalsPage extends State<ProposalsPage>
    with SingleTickerProviderStateMixin {
  double logoHeight = 75;
  double logoWidth = 300;
  TabController tabController;
  ProposalController proposalController = Get.put(ProposalController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      vsync: this,
      initialIndex: 0,
      length: 2,
    );
    proposalController.getMyAdverts();
    proposalController.getMyProposals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: tabController,
        children: [
          MyProposalsPage(),
          MyDonorApplicationPage(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: colorRed,
      actions: [
        IconButton(
          onPressed: () {
            Get.to(NotificationListPage());
          },
          icon: const Icon(
            Icons.notifications,
          ),
        )
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add_box),
      ),
      title: Image.asset(
        'assets/images/akanbeyaz.png',
        height: logoHeight,
        width: logoWidth,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TabBar(
          controller: tabController,
          labelPadding: const EdgeInsets.only(left: 5, right: 5),
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.red,
          tabs: [
            Tab(
              child: SizedBox(
                width: Get.width / 2 - 15,
                child: const Center(
                  child: Text(
                    'Benim ilanlarım',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: SizedBox(
                width: Get.width / 2 - 15,
                child: const Center(
                  child: Text(
                    'Donör başvurularım',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
          indicatorColor: colorRed,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      centerTitle: true,
    );
  }
}
