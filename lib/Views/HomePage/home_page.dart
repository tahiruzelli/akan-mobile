import 'package:akan_mobile/Views/HomePage/widgets/advert_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return AdvertCard();
        },
      ),
    );
  }
}
