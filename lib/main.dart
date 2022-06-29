import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:koinotsirlari/pages/control_page/control_page.dart';
import 'package:koinotsirlari/pages/detail_page/detail_page.dart';
import 'package:koinotsirlari/pages/favorite_page/favorite_page.dart';
import 'package:koinotsirlari/pages/splash_page/splash_page.dart';
import 'package:koinotsirlari/pages/tafakkur_page/tafakkur_page.dart';
import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koinot sirlari',
      theme: ThemeData.dark(
      ),
      home: const SplashPage(),
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        ControlPage.id: (context) => const ControlPage(),
        HomePage.id: (context) => const HomePage(),
        FavoritePage.id: (context) => const FavoritePage(),
        SettingPage.id: (context) => const SettingPage(),
        DetailPage.id: (context) => DetailPage(),
      },
    );
  }
}

