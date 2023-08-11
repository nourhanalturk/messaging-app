import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/layout/layout_controller.dart';
import 'package:messaging_app/managers/color_managers/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder:(controller) =>
          Scaffold(
            bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_sharp)),
            BottomNavigationBarItem(icon: Icon(Icons.phone)),
            BottomNavigationBarItem(icon: Icon(Icons.circle_outlined,color: ManagerColors.blue,)),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt)),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
          ],
          currentIndex: controller.currentIndex,
          onTap: (index) => controller.onBottomNavBarTapped(index),
        ),
            body: controller.screens [controller.currentIndex],
      ),
    );
  }
}
