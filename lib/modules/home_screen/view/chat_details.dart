import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/managers/color_managers/colors.dart';
import 'package:messaging_app/modules/home_screen/controller/home_controller.dart';

class ChatsDetailsScreen extends GetView<HomeController> {
   final  userId ;
   ChatsDetailsScreen({super.key, required this.userId});


  @override
  Widget build(BuildContext context) {
    var model = controller.users.firstWhere((element) => element.uId == userId );
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 80.0,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name!,
            ),
            const SizedBox(height: 5.0,),
            Text(
              'active from ...',
              style: TextStyle(
                fontSize: 15.0
              ),
            ),
          ],
        ) ,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_back_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(

            decoration: BoxDecoration(
              color:Colors.blue[400],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topRight:Radius.circular(20.0),
                topLeft:Radius.circular(20.0) ,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('hi hi',style:TextStyle(
                color: ManagerColors.white
              ) ,),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMessages(){
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        decoration: BoxDecoration(
            color: ManagerColors.grey300,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              topRight:Radius.circular(20.0),
              topLeft:Radius.circular(20.0) ,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('hi hi'),
        ),
      ),
    );
  }
  Widget buildMyMessages(){
    return  Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(

          decoration: BoxDecoration(
              color:Colors.blue[400],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topRight:Radius.circular(20.0),
                topLeft:Radius.circular(20.0) ,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('hi hi',style:TextStyle(
                color: ManagerColors.white
            ) ,),
          ),
        ),
      ),
    );
  }
}
