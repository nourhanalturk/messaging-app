import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:messaging_app/modules/home_screen/model/message_model.dart';
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
          });
          print('USERS======');

          print(users);
    })
        .catchError((error){
          print('big erorrrrrrrr ======');
          print(error.toString());
    });
      }


  UserModel? userModel;

  void getUserData() {
    print('this is the uId $uId');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(value.data());
    }).catchError((error) {
      print(error.toString());
    });
  }
  TextEditingController textController = TextEditingController();
  MessageModel? messageModel;

  void sendMessage({
    required text ,
    required time ,
    required receiverId ,
}){
     messageModel = MessageModel(
      receiverId: receiverId,
      senderId: userModel!.uId,
      text: text,
      time: time,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel!.toMap())
        .then((value) {})
        .catchError((error){
          print(error.toString());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .add(messageModel!.toMap())
        .then((value) {})
        .catchError((error){
      print(error.toString());
    });



  }

  List<MessageModel> messages =[];
  void getMessages({
    required receiverId
}){
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('time')
        .snapshots()
        .listen((event) {
          messages =[];
          event.docs.forEach((element) { 
            messages.add(MessageModel.fromJson(element.data()));
            update();
          });
    })
        .onError((error){
          print(error);
    });
  }
  @override
  void onInit() {
    super.onInit();
    getUserData();
    getAllUsersData();
  }


}