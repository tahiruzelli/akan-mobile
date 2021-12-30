import 'package:akan_mobile/Globals/widgets/detail_line.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
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
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
              'https://media-exp1.licdn.com/dms/image/C4D03AQFe883wZOzNDw/profile-displayphoto-shrink_200_200/0/1592940508582?e=1645056000&v=beta&t=n1uJWoEInQjpeP-Q3Mo_54pNcj4rTXCjK4kqX1GX-Zk'),
        ),
      ),
    );
  }

  Column _buildMyData() {
    return Column(
      children: [
        DetailLine(
          title: 'İsim',
          content: 'Tahir Uzelli',
        ),
        DetailLine(
          title: 'E-mail',
          content: 'tahir.uzelli@gmail.com',
        ),
        DetailLine(
          title: 'Kan Tipi',
          content: '0 Pozitif',
        ),
        DetailLine(
          title: 'Telefon',
          content: '+90 551 552 89 85',
        ),
      ],
    );
  }
}
