import 'package:akan_mobile/Controllers/profile_controller.dart';
import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:akan_mobile/Globals/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'SubPages/manage_account.dart';

class SettingsPage extends StatelessWidget {
  ProfileController profileController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          title('HESAP'),
          button(Icons.person_outline, 'Hesap Ayarları', () {
            Get.to(ManageAccount());
          }),
          button(Icons.lock_outline, 'Gizlilik', () {}),
          button(Icons.security_outlined, 'Güvenlik', () {}),
          divider(),
          title('DESTEK'),
          button(
              Icons.enhance_photo_translate_outlined, 'Problem Bildir', () {}),
          button(Icons.info_outline, 'Yardım Merkezi', () {}),
          button(Icons.safety_divider_outlined, 'Güvenlik Merkezi', () {}),
          divider(),
          title('HAKKIMIZDA'),
          button(Icons.commute_outlined, 'Topluluk Rehberleri', () {}),
          button(Icons.device_thermostat_rounded, 'Kullanım Şartları', () {}),
          button(Icons.privacy_tip, 'Gizlilik Politikası', () {}),
          button(Icons.copyright, 'Telif Hakkı Politikası', () {}),
          divider(),
          button(Icons.exit_to_app, 'Çıkış', () {
            profileController.exitApp();
          }, isRed: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 1,
        width: Get.width * 0.9,
        color: colorTextGrey.withOpacity(0.3),
      ),
    );
  }

  Widget title(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: colorTextGrey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  button(IconData icon, String content, VoidCallback function,
      {bool isRed = false}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 10,
      ),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isRed ? Colors.red : Colors.black,
                  size: 20,
                ),
                SizedBox(width: 10),
                Text(
                  content,
                  style: TextStyle(
                    color: isRed ? Colors.red : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Spacer(),
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
