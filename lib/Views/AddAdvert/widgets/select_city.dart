import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCity extends StatelessWidget {
  final _scrollController = FixedExtentScrollController();
  AddAdvertController addAdvertController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              "Şehir Seçiniz",
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
                            addAdvertController.selectedCity.value.name,
                          )
                        : Text(
                            addAdvertController.selectedCity.value.name,
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
                          itemCount: addAdvertController.cities.value.length,
                          itemHeight: 20,
                          scrollController: _scrollController,
                          onItemTapCallback: (value) {
                            addAdvertController.selectedCity.value.name =
                                addAdvertController.cities.value[value].name;
                            addAdvertController.selectedCity.value.id =
                                addAdvertController.cities.value[value].id;
                            addAdvertController.shoulReload.value =
                                !addAdvertController.shoulReload.value;
                            addAdvertController.getDistricts();
                            Navigator.pop(context);
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: _scrollController,
                            itemExtent: 20,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.002,
                            onSelectedItemChanged: (value) {
                              addAdvertController.selectedCity.value.name =
                                  addAdvertController.cities.value[value].name;
                              addAdvertController.selectedCity.value.id =
                                  addAdvertController.cities.value[value].id;
                              addAdvertController.shoulReload.value =
                                  !addAdvertController.shoulReload.value;
                              addAdvertController.getDistricts();
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) => Center(
                                child: Text(addAdvertController
                                    .cities.value[index].name),
                              ),
                              childCount:
                                  addAdvertController.cities.value.length,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
