import 'package:flutter/material.dart';

class ManagerColors{
  static Color grey300 = Colors.grey[300]! ;
  static Color grey600 = Colors.grey[600]!;
  static Color grey = Colors.grey;
  static Color blue = Colors.blueAccent;
  static Color white = Colors.white;
  static  LinearGradient gradientColor =  const LinearGradient(
    colors: [
      Colors.purple,
      Colors.blueAccent
    ], // Customize the colors as per your preference
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,

  );

}