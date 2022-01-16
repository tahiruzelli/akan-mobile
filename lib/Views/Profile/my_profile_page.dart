import 'package:akan_mobile/Controllers/profile_controller.dart';
import 'package:akan_mobile/Globals/widgets/detail_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPicture(),
            _buildMyData(),
          ],
        ),
      ),
    );
  }

  Padding _buildPicture() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(profileController.myUser.photoUrl),
        ),
      ),
    );
  }

  Column _buildMyData() {
    return Column(
      children: [
        DetailLine(
          title: 'İsim',
          content: profileController.myUser.fullName,
        ),
        DetailLine(
          title: 'E-mail',
          content: profileController.myUser.email,
        ),
        DetailLine(
          title: 'Kan Tipi',
          content: profileController.myUser.bloodType,
        ),
        DetailLine(
          title: 'Telefon',
          content: profileController.myUser.phone,
        ),
      ],
    );
  }
}
