import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: colorRed,
    title: Image.asset(
      'assets/images/akanbeyaz.png',
      height: 75,
      width: 300,
    ),
    centerTitle: true,
  );
}
