import 'package:flutter/material.dart';

class AppColor {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color redColor = Color.fromARGB(255, 255, 0, 0);
  static const Color blueColor = Color.fromRGBO(4, 88, 212, 1);
  static const Color fillColor = Color.fromRGBO(229, 238, 250, 1);
  static const Color lightfillColor = Color.fromRGBO(249, 252, 255, 1);
  static const Color lightblueColor = Color.fromRGBO(244, 249, 255, 1);
  static const Color dividerColor = Color.fromRGBO(97, 97, 101, 1);
  static const Color unselectediconColor = Color.fromRGBO(163, 200, 255, 1);
  static const Color nextButtonColor = Color.fromRGBO(206, 225, 255, 1);
}

// set system primary color
MaterialColor primaryColorSwatch = MaterialColor(
  AppColor.blueColor.value,
  const <int, Color>{
    50: AppColor.blueColor,
    100: AppColor.blueColor,
    200: AppColor.blueColor,
    300: AppColor.blueColor,
    400: AppColor.blueColor,
    500: AppColor.blueColor,
    600: AppColor.blueColor,
    700: AppColor.blueColor,
    800: AppColor.blueColor,
    900: AppColor.blueColor,
  },
);
