import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:messaging_app/modules/login_screen/model.dart';

import '../../../shared_pref/shared_pref.dart';
import '../../../sharing/constance.dart';

class SignUpController extends GetxController{
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController =TextEditingController();

  void userRegister (){
FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
    .then((value){
    UserModel userModel =  UserModel(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
        uId: value.user!.uid,
      );
      FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set(userModel.toMap());
    CacheHelper.saveData(key: 'uid', value: value.user!.uid);
    uId = CacheHelper.getData(key: 'uid');
    update();
})
    .catchError((error){
      print(error.toString());
});
  }

}