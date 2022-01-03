import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChangePhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomTextField(
              labelText: 'Yeni Telefon',
              hintText: '555 555 55 55',
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: colorRed,
      leading: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: SvgPicture.asset(
            'assets/icons/backIcon.svg',
            height: 30,
            width: 30,
            color: colorWhite,
          ),
        ),
      ),
      title: Text(
        'Telefon Değiştir',
        style: TextStyle(
          color: colorWhite,
          fontSize: 14,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.done, color: colorWhite),
        ),
      ],
    );
  }
}
