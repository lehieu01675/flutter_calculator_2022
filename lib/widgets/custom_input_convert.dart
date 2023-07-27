import 'package:calculator/constant/color_constant.dart';
import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class InputConvert extends StatelessWidget {
  final TextEditingController controller;
  final Color backGroundColor = const Color(0xffDFE2E2);
  final String? Function(String?)? validator;
  final TextInputType keyboardType;


  final String hintText;
  final TextStyle text = TextStyle(
    fontSize: 30,
    color: Colors.black.withOpacity(0.8),
    fontWeight: FontWeight.w300,
  );
  InputConvert(
      {super.key,
      required this.controller,
      this.validator,
      required this.hintText,
      required this.keyboardType,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      validator: validator,
      style: text,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          fillColor: ColorConstant.backGroundInputConvert,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyleConstant.inputInputConvert,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }

  factory InputConvert.input(TextEditingController controller, String hintText,
      TextInputType keyboardType) {
    return InputConvert(
      controller: controller,
      hintText: hintText,
      keyboardType: keyboardType,
    );
  }

}
