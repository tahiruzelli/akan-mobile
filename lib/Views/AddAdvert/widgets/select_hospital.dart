import 'package:akan_mobile/Controllers/add_advert_controller.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectHospital extends StatelessWidget {
  final _scrollController = FixedExtentScrollController();
  AddAdvertController addAdvertController = Get.find();
  function(int index) {
    addAdvertController.selectedHospital.value.hospitalName =
        addAdvertController.hospitals.value[index].hospitalName;
    addAdvertController.selectedHospital.value.id =
        addAdvertController.hospitals.value[index].id;
    addAdvertController.shoulReload.value =
        !addAdvertController.shoulReload.value;
  }

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
              "Hastane Seçiniz",
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
                            addAdvertController
                                .selectedHospital.value.hospitalName,
                          )
                        : Text(
                            addAdvertController
                                .selectedHospital.value.hospitalName,
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
                          itemCount: addAdvertController.hospitals.value.length,
                          itemHeight: 20,
                          scrollController: _scrollController,
                          onItemTapCallback: (value) {
                            function(value);
                            Navigator.pop(context);
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: _scrollController,
                            itemExtent: 20,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.002,
                            onSelectedItemChanged: (value) {
                              function(value);
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) => Center(
                                child: Text(
                                  addAdvertController
                                      .hospitals.value[index].hospitalName,
                                ),
                              ),
                              childCount:
                                  addAdvertController.hospitals.value.length,
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
