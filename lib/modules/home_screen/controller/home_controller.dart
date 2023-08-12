import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:messaging_app/modules/login_screen/model.dart';

import '../../../sharing/constance.dart';

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

  List<UserModel> users =[];
  void getAllUsersData(){
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value){
          value.docs.forEach((element)
          {
            print('=====================================success');
            users.add(UserModel.fromJson(element.data()));
            update();
          });
    })
        .catchError((error){
          print(error.toString());
    });
      }


  // UserModel? userModel;
  //
  // void getUserData() {
  //   print('this is the uId $uId');
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .get()
  //       .then((value) {
  //     userModel = UserModel.fromJson(value.data()!);
  //     print(value.data());
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }

  @override
  void onInit() {
    super.onInit();
   // getUserData();
    getAllUsersData();
  }


}