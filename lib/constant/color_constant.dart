import 'package:flutter/cupertino.dart';

class ColorConstant {
  static LinearGradient backGroundColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 158, 203, 182),
        Color.fromARGB(255, 155, 207, 183),
        Color.fromARGB(255, 156, 206, 182),
        Color.fromARGB(255, 174, 190, 182),
        Color.fromARGB(255, 209, 209, 209),
      ]);

  static Color whiteButton = const Color.fromARGB(255, 255, 255, 255);
  static Color dropDownButton1 = const Color(0xffBEE4E7);
  static Color dropDownButton2 = const Color.fromARGB(255, 192, 231, 203);
  static Color backGroundInputConvert =
      const Color.fromARGB(255, 235, 243, 243);
  static Color buttonConvert = const Color.fromARGB(255, 139, 164, 228);
}
