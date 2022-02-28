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
      child: SizedBox(
        height: Get.height / 5,
        width: Get.width / 2,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.height / 5,
                width: Get.width / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      profileController.myUser.photoUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 10,
              child: IconButton(
                onPressed: () {
                  profileController.changeProfilPhoto();
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.red,
                ),
              ),
            )
          ],
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
