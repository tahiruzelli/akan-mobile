import 'package:akan_mobile/Views/Proposals/widgets/my_advert_card.dart';
import 'package:flutter/material.dart';

class MyProposalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return MyAdvertCard(index);
        },
      ),
    );
  }
}
