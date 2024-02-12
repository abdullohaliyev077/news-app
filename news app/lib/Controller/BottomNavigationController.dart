import 'package:flutter_application_2/Pages/ArticalPage/ArticalPage.dart';
import 'package:flutter_application_2/Pages/HomePage/HomePage.dart';
import 'package:flutter_application_2/Pages/Profile/ProfilePage.dart';
import 'package:get/get.dart';


class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const ArticalPage(),
    const ProfilePage(),
  ];
}
