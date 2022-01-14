import 'package:akan_mobile/Controllers/advert_controller.dart';
import 'package:akan_mobile/Controllers/message_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/detail_line.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdvertDetail extends StatelessWidget {
  AdvertController advertController = Get.put(AdvertController());
  MessageController messageController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    advertController.getAdvertDetail();
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(
        () => advertController.advertsLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : ListView(
                children: [
                  _buildImageArea(),
                  _buildData(),
                  _buildSeeLocationButton(),
                  _buildDetails(),
                  _buildButtons(),
                ],
              ),
      ),
    );
  }

  _buildSeeLocationButton() {
    return InkWell(
      onTap: () {
        _buildMap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.02),
                  child: const Text('Konumu Gör'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: Get.width * 0.02),
                  child: const Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> _buildMap() {
    return Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.height * 0.05, vertical: Get.height * 0.18),
        child: Container(
          height: Get.height * 0.6,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (map) {},
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(
                      10.0,
                      20,
                    ),
                    zoom: 10,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildProposalButton(),
        _buildMessageButton(),
      ],
    );
  }

  ElevatedButton _buildMessageButton() {
    return ElevatedButton(
      onPressed: () {
        messageController.getChatRoomWithUser(
            advertController.choosenAdvert.advertCreatorId.toString());
      },
      style: ElevatedButton.styleFrom(
        primary: colorBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
        child: Center(
          child: Obx(
            () => messageController.loading.value
                ? const CupertinoActivityIndicator()
                : const Text('Mesaj At'),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildProposalButton() {
    return ElevatedButton(
      onPressed: () {
        advertController.onDonorOlButtonPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: colorRed,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
        child: Center(
          child: Obx(
            () => advertController.beDonorLoading.value
                ? const CupertinoActivityIndicator()
                : const Text('Donör Ol!'),
          ),
        ),
      ),
    );
  }

  Padding _buildDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            advertController.advertDetail.advert.details,
          ),
        ),
      ),
    );
  }

  Column _buildData() {
    return Column(
      children: [
        DetailLine(
          title: 'İsim',
          content: advertController.advertDetail.advertCreator.first.fullName,
        ),
        DetailLine(
          title: 'E-mail',
          content: advertController.advertDetail.advertCreator.first.email,
        ),
        DetailLine(
          title: 'Kan Tipi',
          content: advertController.advertDetail.advertCreator.first.bloodType,
        ),
        DetailLine(
          title: 'Telefon',
          content: advertController.advertDetail.advertCreator.first.phone,
        ),
        DetailLine(
          title: 'Oluşturma Tarihi',
          content:
              advertController.advertDetail.advert.creationTime.split('T')[0],
        ),
        DetailLine(
          title: 'Şehir',
          content: advertController.advertDetail.advertHospital.first.adress,
        ),
        DetailLine(
          title: 'Hastane',
          content:
              advertController.advertDetail.advertHospital.first.hospitalName,
        ),
      ],
    );
  }

  SizedBox _buildImageArea() {
    return SizedBox(
      height: Get.height * 0.3,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: advertController.advertDetail.advertPhotos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  advertController.advertDetail.advertPhotos[index].url,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
