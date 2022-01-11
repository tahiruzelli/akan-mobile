import 'package:akan_mobile/Controllers/register_controller.dart';
import 'package:akan_mobile/Globals/widgets/custom_textfield.dart';
import 'package:akan_mobile/Globals/widgets/password_field.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  final _scrollController = FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Üye Olalım',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    loginWelcomeText(context),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: registerController.emailController,
                      labelText: 'E-mail adres',
                      hintText: 'example@mail.com',
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: registerController.fullnameController,
                      labelText: 'Tam isminiz',
                      hintText: 'isim soyisim',
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: registerController.telephoneController,
                      labelText: 'Telefon numaranız',
                      hintText: '5*********',
                    ),
                    const SizedBox(height: 20),
                    citiesWidget(context),
                    const SizedBox(height: 20),
                    districtWidget(context),
                    const SizedBox(height: 20),
                    bloodTypeWidget(context),
                    const SizedBox(height: 20),
                    PasswordField(
                      controller: registerController.passwordController,
                    ),
                  ],
                ),
                registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bloodTypeWidget(context) {
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
              "Kan Tipi Seçiniz",
              style: TextStyle(fontSize: Get.width * 0.04),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Obx(
                    () => registerController.shoulReload.value
                        ? Text(
                            registerController.selectedBloodtype.value.type,
                          )
                        : Text(
                            registerController.selectedBloodtype.value.type,
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
                          itemCount: registerController.bloodTypes.value.length,
                          itemHeight: 20,
                          scrollController: _scrollController,
                          onItemTapCallback: (value) {
                            registerController.selectedBloodtype.value.type =
                                registerController.bloodTypes.value[value].type;
                            registerController.selectedBloodtype.value.id =
                                registerController.bloodTypes.value[value].id;
                            registerController.shoulReload.value =
                                !registerController.shoulReload.value;
                            registerController.getDistricts();
                            Navigator.pop(context);
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: _scrollController,
                            itemExtent: 20,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.002,
                            onSelectedItemChanged: (value) {
                              registerController.selectedBloodtype.value.type =
                                  registerController
                                      .bloodTypes.value[value].type;
                              registerController.selectedBloodtype.value.id =
                                  registerController.bloodTypes.value[value].id;
                              registerController.shoulReload.value =
                                  !registerController.shoulReload.value;
                              registerController.getDistricts();
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) => Center(
                                child: Text(registerController
                                    .bloodTypes.value[index].type),
                              ),
                              childCount:
                                  registerController.bloodTypes.value.length,
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

  Widget districtWidget(context) {
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
                    () => registerController.shoulReload.value
                        ? Text(
                            registerController.selectedDistrict.value.name,
                          )
                        : Text(
                            registerController.selectedDistrict.value.name,
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
                          itemCount: registerController.districts.length,
                          itemHeight: 20,
                          scrollController: _scrollController,
                          onItemTapCallback: (value) {
                            registerController.selectedDistrict.value.name =
                                registerController.districts[value].name;
                            registerController.selectedDistrict.value.id =
                                registerController.districts[value].id;
                            registerController.selectedDistrict.value.cityId =
                                registerController.districts[value].cityId;
                            registerController.shoulReload.value =
                                !registerController.shoulReload.value;
                            Navigator.pop(context);
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: _scrollController,
                            itemExtent: 20,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.002,
                            onSelectedItemChanged: (value) {
                              registerController.selectedDistrict.value.name =
                                  registerController.districts[value].name;
                              registerController.selectedDistrict.value.id =
                                  registerController.districts[value].id;
                              registerController.selectedDistrict.value.cityId =
                                  registerController.districts[value].cityId;
                              registerController.shoulReload.value =
                                  !registerController.shoulReload.value;
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) => Center(
                                child: Text(
                                    registerController.districts[index].name),
                              ),
                              childCount: registerController.districts.length,
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

  Widget citiesWidget(context) {
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
                    () => registerController.shoulReload.value
                        ? Text(
                            registerController.selectedCity.value.name,
                          )
                        : Text(
                            registerController.selectedCity.value.name,
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
                          itemCount: registerController.cities.value.length,
                          itemHeight: 20,
                          scrollController: _scrollController,
                          onItemTapCallback: (value) {
                            registerController.selectedCity.value.name =
                                registerController.cities.value[value].name;
                            registerController.selectedCity.value.id =
                                registerController.cities.value[value].id;
                            registerController.shoulReload.value =
                                !registerController.shoulReload.value;
                            registerController.getDistricts();
                            Navigator.pop(context);
                          },
                          child: ListWheelScrollView.useDelegate(
                            controller: _scrollController,
                            itemExtent: 20,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.002,
                            onSelectedItemChanged: (value) {
                              registerController.selectedCity.value.name =
                                  registerController.cities.value[value].name;
                              registerController.selectedCity.value.id =
                                  registerController.cities.value[value].id;
                              registerController.shoulReload.value =
                                  !registerController.shoulReload.value;
                              registerController.getDistricts();
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              builder: (context, index) => Center(
                                child: Text(registerController
                                    .cities.value[index].name),
                              ),
                              childCount:
                                  registerController.cities.value.length,
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

  SizedBox registerButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          registerController.onRegisterButtonPressed();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondaryVariant)),
        child: const Text('Üye ol'),
      ),
    );
  }

  Text loginWelcomeText(BuildContext context) {
    return Text('Akan olma vaktin gelmişti',
        style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.secondary, fontSize: 20));
  }
}
