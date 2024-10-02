import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_application/pages/ArticlePage.dart';
import 'package:news_application/pages/HomePage.dart';
import 'package:news_application/pages/ProfilePage.dart';

class BottomNavController extends GetxController{

RxInt index = 0.obs;

var  pages = [

  Homepage(),
  Articlepage(),
  SettingPage(),
];

}