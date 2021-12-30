import 'package:akan_mobile/Views/Proposals/widgets/my_application_card.dart';
import 'package:flutter/material.dart';

class MyDonorApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MyApplicationCard(index);
        },
      ),
    );
  }
}
