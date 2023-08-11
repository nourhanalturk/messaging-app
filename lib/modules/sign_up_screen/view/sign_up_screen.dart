import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/managers/color_managers/colors.dart';
import 'package:messaging_app/managers/sting_manager/string_manager.dart';
import 'package:messaging_app/modules/login_screen/login_screen.dart';
import 'package:messaging_app/modules/sign_up_screen/controller/signUp_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SignUpController>(
          init: SignUpController(),
          builder:(controller) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.signUp,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      controller:controller.nameController ,
                      decoration: InputDecoration(
                          border:UnderlineInputBorder(),
                          hintText: ManagerStrings.userName,
                          hintStyle: TextStyle(
                            color: ManagerColors.grey,
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(
                      controller:controller.emailController ,
                      decoration: InputDecoration(
                          border:UnderlineInputBorder(),
                          hintText: ManagerStrings.email,
                          hintStyle: TextStyle(
                            color: ManagerColors.grey,
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller:controller.passwordController ,
                      decoration: InputDecoration(
                          border:UnderlineInputBorder(),
                          hintText: ManagerStrings.password,
                          hintStyle: TextStyle(
                            color: ManagerColors.grey,
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller:controller.phoneController ,
                      decoration: InputDecoration(
                          border:UnderlineInputBorder(),
                          hintText: ManagerStrings.userPhone,
                          hintStyle: TextStyle(
                            color: ManagerColors.grey,
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: ManagerColors.gradientColor, // Your LinearGradient defined earlier
                      ),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: (){
                          controller.userRegister();
                        },
                        child: Text(
                          ManagerStrings.signUp,
                          style: TextStyle(
                            color:ManagerColors.white ,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: [
                        Text(ManagerStrings.dontHavaAnAccount),
                        TextButton(
                            onPressed: (){
                              Get.to(()=>LoginScreen());

                            },
                            child: Text(ManagerStrings.login))
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
