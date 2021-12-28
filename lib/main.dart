import 'package:akanmobile/Views/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'Globals/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akan - Acil Kan',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().appTheme,
      home: const LoginScreen(),
    );
  }
}
