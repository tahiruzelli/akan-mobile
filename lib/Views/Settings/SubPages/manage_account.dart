import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:akan_mobile/Views/Settings/SubPages/change_name_page.dart';
import 'package:akan_mobile/Views/Settings/SubPages/change_password_page.dart';
import 'package:akan_mobile/Views/Settings/SubPages/change_phone_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'change_email_page.dart';

class ManageAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          accountRow('İsim', 'Tahir Uzelli', ChangeName()),
          divider(),
          accountRow('E-Mail', 'tahir.uzelli@gmail.com', ChangeEmail()),
          divider(),
          accountRow('Telefon', '551 552 89 85', ChangePhone()),
          divider(),
          accountRow('Şehir', 'İstanbul', Container()),
          divider(),
          accountRow('Şifre', '*************', ChangePassword()),
          divider(),
        ],
      ),
    );
  }

  Widget divider() {
    return Container(
      height: 1,
      width: Get.width * 0.95,
      color: Colors.grey[200],
    );
  }

  Widget accountRow(String key, String value, page) {
    return InkWell(
      onTap: () {
        Get.to(page);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Text(
              key,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
