import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/select_blood_type.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/select_city.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/select_district.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/select_hospital.dart';
import 'package:akan_mobile/Views/AddAdvert/widgets/select_photo_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdvertPage extends StatelessWidget {
  AddAdvertController addAdvertController = Get.put(AddAdvertController());
  double pagePadding = 20;
  double itemPadding = 20;
  @override
  Widget build(BuildContext context) {
    addAdvertController.resetVars();
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: postButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pagePadding),
        child: ListView(
          children: [
            SelectPhotoArea(),
            SizedBox(height: itemPadding),
            SelectCity(),
            SizedBox(height: itemPadding),
            SelectDistrict(),
            SizedBox(height: itemPadding),
            SelectBloodType(),
            SizedBox(height: itemPadding),
            SelectHospital(),
            SizedBox(height: itemPadding),
            descriptionArea(),
          ],
        ),
      ),
    );
  }

  SizedBox descriptionArea() {
    return SizedBox(
      height: Get.height * 0.3,
      child: Card(
        child: TextFormField(
          controller: addAdvertController.detailController,
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
