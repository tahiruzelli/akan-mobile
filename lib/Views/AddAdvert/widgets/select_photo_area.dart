import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectPhotoArea extends StatelessWidget {
  AddAdvertController addAdvertController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      height: Get.height * 0.18,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: addAdvertController.images.length + 1,
            itemBuilder: (BuildContext context, int index2) {
              return SizedBox(
                width: Get.width * 0.3,
                child: InkWell(
                  onTap: () {
                    if (index2 == addAdvertController.images.length &&
                        addAdvertController.images.length < 10) {
                      addAdvertController.getImage();
                    }
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: Get.width * 0.3,
                        color: colorLightGrey,
                        child: addAdvertController.images.length != null
                            ? (index2 < addAdvertController.images.length
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Image.file(
                                        addAdvertController.images[index2],
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: AutoSizeText(
                                      10 - addAdvertController.images.length ==
                                              0
                                          ? "Daha fazla fotoğraf ekleyemezsiniz!"
                                          : "${10 - addAdvertController.images.length} tane daha ekleyebilirsiniz",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: colorRed,
                                      ),
                                    ),
                                  ))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  index2 == 0
                                      ? const Icon(Icons.add_a_photo)
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Fotoğraf yüklemek için tıklayın",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: Get.width * 0.03,
                                                fontWeight: FontWeight.normal,
                                                color: colorRed),
                                          ),
                                        )
                                ],
                              ),
                      ),
                      Visibility(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              if (index2 != addAdvertController.images.length) {
                                addAdvertController.images.removeAt(index2);
                              }
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        visible: index2 != addAdvertController.images.length
                            ? true
                            : false,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
