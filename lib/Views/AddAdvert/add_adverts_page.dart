import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/dropdown_row.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/select_photo_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdvertPage extends StatelessWidget {
  AddAdvertController addAdvertController = Get.put(AddAdvertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: postButton(),
      body: ListView(
        children: [
          SelectPhotoArea(),
          DropDownRow(
            title: 'Şehir Seçiniz',
            dropDownList: addAdvertController.dropDownList,
            dropDownName: addAdvertController.dropDownName,
            function: (int index) {
              addAdvertController.dropDownName.value =
                  addAdvertController.dropDownList[index];
            },
          ),
          DropDownRow(
            title: 'İlçe Seçiniz',
            dropDownList: addAdvertController.dropDownList,
            dropDownName: addAdvertController.dropDownName,
            function: (int index) {
              addAdvertController.dropDownName.value =
                  addAdvertController.dropDownList[index];
            },
          ),
          DropDownRow(
            title: 'Hastane Seçiniz',
            dropDownList: addAdvertController.dropDownList,
            dropDownName: addAdvertController.dropDownName,
            function: (int index) {
              addAdvertController.dropDownName.value =
                  addAdvertController.dropDownList[index];
            },
          ),
          DropDownRow(
            title: 'Kan Grubunuzu Seçiniz',
            dropDownList: addAdvertController.dropDownList,
            dropDownName: addAdvertController.dropDownName,
            function: (int index) {
              addAdvertController.dropDownName.value =
                  addAdvertController.dropDownList[index];
            },
          ),
          descriptionArea(),
        ],
      ),
    );
  }

  SizedBox descriptionArea() {
    return SizedBox(
      height: Get.height * 0.3,
      child: Card(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {},
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.poppins(fontSize: 12),
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "  Lütfen açıklama giriniz",
            hintStyle: GoogleFonts.poppins(fontSize: 15),
          ),
        ),
      ),
    );
  }

  FloatingActionButton postButton() {
    return FloatingActionButton(
      backgroundColor: colorRed,
      onPressed: () {
        addAdvertController.createAdvert();
      },
      child: Icon(
        Icons.send,
        color: colorWhite,
      ),
    );
  }
}
