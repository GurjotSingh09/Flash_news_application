import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_application/pages/ArticlePage.dart';
import 'package:news_application/pages/DemoPageShimmer.dart';
import 'package:news_application/pages/HomePage.dart';
import 'package:news_application/pages/HomePageController.dart';
import 'package:news_application/pages/NewsDetailPage.dart';


import 'Controller/BottomNavController.dart';
import 'config/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BottomNavController controller =  Get.put(BottomNavController());
    Get.lazyPut(()=>Articlepage());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: HomePageController(),
    );
  }
}



