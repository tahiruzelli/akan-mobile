import 'package:akan_mobile/Views/Main/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'Globals/theme_manager.dart';
import 'Views/Login/login_page.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Akan - Acil Kan',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().appTheme,
      home: GetStorage().read('UserData') == null
          ? const LoginScreen()
          : MainPage(),
    );
  }
}
