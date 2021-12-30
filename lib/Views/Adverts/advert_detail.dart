import 'package:akan_mobile/Controllers/advert_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/detail_line.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertDetail extends StatelessWidget {
  AdvertController advertController = Get.put(AdvertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          _buildImageArea(),
          _buildMyData(),
          _buildDetails(),
          _buildButtons(),
        ],
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
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: colorBlue,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
        child: Center(
          child: Text('Mesaj At'),
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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
        child: Center(
          child: Text('Donör Ol!'),
        ),
      ),
    );
  }

  Padding _buildDetails() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              'Merhaba ismim tahir kardesim yakin vakitte trafik kazasi gecirdi gunde birden cok kez ameliyat oluyor dolayisiyla surekli kana ihtiyac oluyor. Sigara ve alkol tuketmeyen temiz kani olan arkadaslarim lutfen destekte bulunabilir misiniz? Dilediginiz zaman telefondan ulasabilirsiniz.'),
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
        DetailLine(
          title: 'Oluşturma Tarihi',
          content: '2021-12-30',
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
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://www.elmas67.com/images/haberler/2019/11/acil-kan-ihtiyaci_39722.png'),
              ),
            ),
          );
        },
      ),
    );
  }
}
