import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:messaging_app/shared_pref/shared_pref.dart';
import 'package:messaging_app/sharing/constance.dart';

import 'model.dart';

class loginController extends GetxController{

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  void userLogin(){
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
        .then((value){
      CacheHelper.saveData(key: 'uid', value: value.user!.uid);
      uId = CacheHelper.getData(key: 'uid');
      print('UID saved successfully');
      print(uId);

    })
        .catchError((error){
          print(error.toString());
          print('error=======================');
    });
  }


}