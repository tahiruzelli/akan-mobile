import 'package:akan_mobile/Controllers/main_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Views/main/widgets/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _buildAppBar(),
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
          title: const Text('Home'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text('Users'),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text(
            'Messages ',
          ),
          activeColor: Colors.white,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
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
      title: const Text(
        'AKAN',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }
}
