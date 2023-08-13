import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/managers/color_managers/colors.dart';
import 'package:messaging_app/modules/home_screen/view/chat_details.dart';

import '../../../sharing/constance.dart';
import '../../login_screen/model.dart';
import '../controller/home_controller.dart';

class MessagesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:(controller) {
        return Expanded(
        child: ListView.separated(
          itemCount: controller.users.length,
          itemBuilder: (BuildContext context, int index) {
            if(controller.users[index].uId!= uId){
            return buildUsers(context,controller.users[index]);
            }else{
              return SizedBox.shrink();
            }
            },
          separatorBuilder: (BuildContext context, int index)=> SizedBox(height: 8.0,)
        )
      );
      }
    );
  }

  Widget buildUsers (context, UserModel user){
    return  InkWell(
      onTap: (){
    Get.to(()=> ChatsDetailsScreen(userId: user.uId));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  child: Image(
                    image: NetworkImage(
                      user.profileImage!
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 9.0,
                  backgroundColor : Colors.white,
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ) ,
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name!,
                  style: const TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height:5.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: Text(
                    'the messages here the messages here  the messages here the messages here',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ManagerColors.grey,
                    ),
                    maxLines:1 ,
                    overflow: TextOverflow.ellipsis,

                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text('17:00',style: TextStyle(fontSize:15.0,color: ManagerColors.grey ),),
                SizedBox(height: 8.0,),
                Icon(Icons.check_circle,color: ManagerColors.grey600,size: 15.0,)
              ],
            )
          ],
        ),
      ),
    );
  }
}