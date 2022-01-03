import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownRow extends StatelessWidget {
  AddAdvertController addAdvertController = Get.find();
  final function;
  String title;
  RxString dropDownName;
  List dropDownList;
  DropDownRow(
      {this.title, this.function, this.dropDownList, this.dropDownName});
  final _scrollController = FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.02),
            child: Text(
              title,
              style: GoogleFonts.sourceSansPro(fontSize: Get.width * 0.04),
            ),
          ),
          SizedBox(
            width: Get.width * 0.42,
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                child: Obx(
                  () => Text(
                    dropDownName.value.isEmpty
                        ? 'Lütfen kategori seçiniz.'
                        : dropDownName.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return ClickableListWheelScrollView(
                        itemCount: dropDownList.length,
                        itemHeight: 50,
                        scrollController: _scrollController,
                        onItemTapCallback: (value) {
                          function(value);
                          Navigator.pop(context);
                        },
                        child: ListWheelScrollView.useDelegate(
                          controller: _scrollController,
                          itemExtent: 50,
                          physics: const FixedExtentScrollPhysics(),
                          overAndUnderCenterOpacity: 0.5,
                          perspective: 0.002,
                          onSelectedItemChanged: (value) {
                            function(value);
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) => Center(
                              child: Text(dropDownList[index]),
                            ),
                            childCount: dropDownList.length,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
