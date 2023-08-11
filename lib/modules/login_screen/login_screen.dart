import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messaging_app/managers/color_managers/colors.dart';
import 'package:messaging_app/managers/sting_manager/string_manager.dart';
import 'package:messaging_app/modules/home_screen/view/home_screen.dart';
import 'package:messaging_app/modules/login_screen/controller.dart';
import 'package:messaging_app/modules/sign_up_screen/view/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<loginController>(
          init: loginController(),
          builder:(controller) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ManagerStrings.login,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
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
                    height: 50.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: ManagerColors.gradientColor, // Your LinearGradient defined earlier
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: (){
                        controller.userLogin();
                        Get.offAll(()=> HomeScreen());
                        // if(controller.isLoggedSuccess.value)
                        //   {
                        //     Get.offAll(()=> HomeScreen());
                        //   }
                      },
                      child: Text(
                        ManagerStrings.login,
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
                            Get.to(()=>SignUpScreen());
                          },
                          child: Text(ManagerStrings.signUp))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
