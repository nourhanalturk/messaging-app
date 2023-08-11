import 'package:get/get.dart';
import 'package:messaging_app/modules/calls_screen/view/calls_screen.dart';
import 'package:messaging_app/modules/home_screen/view/home_screen.dart';

class LayoutController extends GetxController{

  List screens = [
    HomeScreen(),
    CallsScreen(),

  ];
  int currentIndex = 0;
  void onBottomNavBarTapped (int index){
    currentIndex =  index ;
    update();
  }
}