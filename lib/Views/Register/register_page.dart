import 'package:akan_mobile/Globals/widgets/custom_textfield.dart';
import 'package:akan_mobile/Globals/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  labelText: 'E-mail adres',
                  hintText: 'example@mail.com',
                ),
                const SizedBox(height: 20),
                const PasswordField(),
              ],
            ),
            registerButton(context),
          ],
        ),
      ),
    );
  }

  SizedBox registerButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
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
