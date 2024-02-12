import 'package:flutter/material.dart';
import 'package:flutter_application_2/Components/NavigationBar.dart';
import 'package:get/get.dart';


import 'Controller/BottomNavigationController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      floatingActionButton: const MyBottonNav(),
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
