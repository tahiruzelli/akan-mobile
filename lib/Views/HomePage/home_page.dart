import 'package:akan_mobile/Controllers/advert_controller.dart';
import 'package:akan_mobile/Views/HomePage/widgets/advert_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  AdvertController advertController = Get.put(AdvertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => advertController.advertsLoading.value
            ? const CupertinoActivityIndicator()
            : ListView.builder(
                itemCount: advertController.adverts.length,
                itemBuilder: (context, index) {
                  return AdvertCard(advertController.adverts.value[index]);
                },
              ),
      ),
    );
  }
}
