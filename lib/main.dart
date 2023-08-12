import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:messaging_app/modules/home_screen/view/home_screen.dart';
import 'package:messaging_app/modules/login_screen/login_screen.dart';
import 'package:messaging_app/shared_pref/shared_pref.dart';
import 'package:messaging_app/sharing/constance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  String? uId = CacheHelper.getData(key: 'uid');
  print('uId from shared preferences: $uId');

  runApp(MyApp(startWidget: uId != null ? HomeScreen() : LoginScreen()));
}

class MyApp extends StatelessWidget {
  final Widget startWidget ;
  const MyApp({super.key,required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:startWidget,
    );
  }
}

