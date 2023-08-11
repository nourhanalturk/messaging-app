import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController{

  int currentButtonIndex =0 ;
  List<bool> isButtonSelected = [true ,false ,false] ;
  void onButtonPressed(int index){
    currentButtonIndex =index ;
    for(int i =0 ;i<3 ;i++){
      if(i == index) {
        isButtonSelected[i] = true;
      }else{
        isButtonSelected[i] =false ;
      }
    }
    update();
  }
}