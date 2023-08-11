import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:messaging_app/modules/login_screen/model.dart';

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
      FirebaseFirestore.instance.collection('users').doc(userModel.uId).set(userModel.toMap());
      update();
})
    .catchError((error){
      print(error.toString());
});
  }

}