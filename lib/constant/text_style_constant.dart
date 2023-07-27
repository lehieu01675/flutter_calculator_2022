import 'package:calculator/constant/font_constant.dart';
import 'package:flutter/cupertino.dart';

class TextStyleConstant {
  static TextStyle appName = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontFamily: FontContant.robotoBold,
      fontSize: 50,
      fontWeight: FontWeight.w500);
  static TextStyle textButton = TextStyle(
      color: const Color(0xff707070),
      fontFamily: FontContant.robotoBold,
      fontSize: 32,
      fontWeight: FontWeight.w400);

  static TextStyle textResult1 = TextStyle(
      color: const Color(0xff000000),
      fontFamily: FontContant.robotoBold,
      fontSize: 70,
      fontWeight: FontWeight.w400);
  static TextStyle resisterResult = TextStyle(
      color: const Color(0xff000000),
      fontFamily: FontContant.robotoBold,
      fontSize: 40,
      fontWeight: FontWeight.w400);
  static TextStyle textResult2 = TextStyle(
      color: const Color(0xff000000),
      fontFamily: FontContant.robotoBold,
      fontSize: 30,
      fontWeight: FontWeight.w400);

  static TextStyle outPutResult1 = TextStyle(
      color: const Color(0xffffffff),
      fontFamily: FontContant.robotoBold,
      fontSize: 70,
      fontWeight: FontWeight.w400);
  static TextStyle outPutResult2 = TextStyle(
      color: const Color(0xffffffff),
      fontFamily: FontContant.robotoBold,
      fontSize: 30,
      fontWeight: FontWeight.w400);

  static TextStyle opr = TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255),
      fontFamily: FontContant.robotoBold,
      fontSize: 30,
      fontWeight: FontWeight.w300);
  static TextStyle textDropButton = TextStyle(
      color: const Color(0xff000000).withOpacity(0.8),
      fontFamily: FontContant.robotoBold,
      fontSize: 25,
      fontWeight: FontWeight.w300);
  static TextStyle textDropButton2 = TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
      fontFamily: FontContant.robotoBold,
      fontSize: 25,
      fontWeight: FontWeight.w300);
  static TextStyle textDropButton3 = TextStyle(
      color: const Color(0xff000000).withOpacity(0.8),
      fontFamily: FontContant.robotoBold,
      fontSize: 16,
      fontWeight: FontWeight.w300);

  static TextStyle inputInputConvert = TextStyle(
      color: const Color(0xff000000).withOpacity(0.8),
      fontSize: 20,
      fontWeight: FontWeight.w500);
  static TextStyle inputInputConvert2 = TextStyle(
      color: const Color(0xff000000).withOpacity(0.8),
      fontSize: 13,
      fontWeight: FontWeight.w400);
  static TextStyle textButtonConvert = TextStyle(
      color: const Color(0xffFFFFFF),
      fontFamily: FontContant.robotoBold,
      fontSize: 20,
      fontWeight: FontWeight.w400);
  static TextStyle titleAppBar = TextStyle(
      color: const Color.fromARGB(255, 255, 255, 255),
      fontFamily: FontContant.robotoBold,
      fontSize: 30,
      fontWeight: FontWeight.w400);

  static TextStyle resistorColorTitle = TextStyle(
      color: const Color(0xff000000).withOpacity(0.8),
      fontSize: 25,
      fontWeight: FontWeight.w500);
  static TextStyle tabHexAndRGB = TextStyle(
      color: const Color(0xff000000).withOpacity(0.8),
      fontSize: 20,
      fontWeight: FontWeight.w400);
}
