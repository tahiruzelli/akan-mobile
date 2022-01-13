import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDistrict extends StatelessWidget {
  final _scrollController = FixedExtentScrollController();
  AddAdvertController addAdvertController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.02),
            child: Text(
              "Ilçe Seçiniz",
              style: TextStyle(fontSize: Get.width * 0.04),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Obx(
                    () => addAdvertController.shoulReload.value
                        ? Text(
                            addAdvertController.selectedDistrict.value.name,
                          )
                        : Text(
                            addAdvertController.selectedDistrict.value.name,
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
                          itemCount: addAdvertController.districts.length,
                          itemHeight: 20,
                          scrollController: _scrollController,
                          onItemTapCallback: (value) {
                            addAdvertController.selectedDistrict.value.name =
                                addAdvertController.districts[value].name;
                            addAdvertController.selectedDistrict.value.id =
                                addAdvertController.districts[value].id;
                            addAdvertController.selectedDistrict.value.cityId =
                                addAdvertController.districts[value].cityId;
                            addAdvertController.shoulReload.value =
                                !addAdvertController.shoulReload.value;
                            Navigator.pop(context);
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: _scrollController,
                            itemExtent: 20,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.002,
                            onSelectedItemChanged: (value) {
                              addAdvertController.selectedDistrict.value.name =
                                  addAdvertController.districts[value].name;
                              addAdvertController.selectedDistrict.value.id =
                                  addAdvertController.districts[value].id;
                              addAdvertController
                                      .selectedDistrict.value.cityId =
                                  addAdvertController.districts[value].cityId;
                              addAdvertController.shoulReload.value =
                                  !addAdvertController.shoulReload.value;
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) => Center(
                                child: Text(
                                    addAdvertController.districts[index].name),
                              ),
                              childCount: addAdvertController.districts.length,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
