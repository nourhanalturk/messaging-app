import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/managers/color_managers/colors.dart';
import 'package:messaging_app/managers/sting_manager/string_manager.dart';
import 'package:messaging_app/modules/home_screen/controller/home_controller.dart';

import 'active_body.dart';
import 'groups_body.dart';
import 'message_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) =>  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0 ,top:10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: ManagerColors.grey600,
                            ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 15.0,
                    )

                  ],
                ),
              ),
              Container(
                height:2.0,
                color: ManagerColors.grey300,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: (){
                          controller.onButtonPressed(0);
                        },
                        child: Text(
                          ManagerStrings.messages,
                          style: TextStyle(
                            color:controller.isButtonSelected[0]?ManagerColors.blue: ManagerColors.grey600,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: (){
                          controller.onButtonPressed(1);

                        },
                        child: Text(
                          ManagerStrings.active,
                          style: TextStyle(
                            color:controller.isButtonSelected[1]?ManagerColors.blue: ManagerColors.grey600,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: (){
                          controller.onButtonPressed(2);
                        },
                        child: Text(
                          ManagerStrings.groups,
                          style: TextStyle(
                            color:controller.isButtonSelected[2]?ManagerColors.blue: ManagerColors.grey600,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height:2.0,
                    color: ManagerColors.grey300,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: controller.currentButtonIndex *( MediaQuery.of(context).size.width /3),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height:2.0,
                      color: ManagerColors.blue,
                    ),
                  ),
                ],
              ),
           if (controller.currentButtonIndex == 0)
              MessagesContent(),
             if (controller.currentButtonIndex == 1)
              ActiveContent(),
             if (controller.currentButtonIndex == 2)
              GroupsContent(),

            ],
          ),
        ),
      ),
    );
  }
}




