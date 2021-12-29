import 'package:akan_mobile/Controllers/main_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/HomePage/home_page.dart';
import 'package:akan_mobile/Views/main/widgets/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  double logoHeight = 75;
  double logoWidth = 300;
  MainController mainController = Get.put(MainController());
  List mainPages = [
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _buildAppBar(),
        body: mainPages[mainController.currentIndex.value],
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: mainController.currentIndex.value,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) {
        mainController.currentIndex.value = index;
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Ana Sayfa'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text('Mesajlarım'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.notifications),
          title: const Text('Bildirimler'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profil'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: colorRed,
      title: Image.asset(
        'assets/images/akanbeyaz.png',
        height: logoHeight,
        width: logoWidth,
      ),
      centerTitle: true,
    );
  }
}