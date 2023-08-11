import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class loginController extends GetxController{

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  RxBool isLoggedSuccess = false.obs ;
  void userLogin(){
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
        .then((value){
          print('success========================');
      isLoggedSuccess.value = true ;
          update();
    })
        .catchError((error){});
  }

}