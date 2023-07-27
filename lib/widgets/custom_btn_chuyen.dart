import 'package:calculator/constant/color_constant.dart';
import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class CustomButtonConvert extends StatelessWidget {
  final String label;
  final Size size;
  final VoidCallback? onPress;

  final Color backgroundColor = ColorConstant.buttonConvert;
  final TextStyle textButton = TextStyleConstant.textButtonConvert;
  CustomButtonConvert(
      {super.key,
      required this.label,
      required this.onPress,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(label, style: textButton),
        ),
      ),
    );
  }

  factory CustomButtonConvert.convert(VoidCallback onPress, Size size) {
    return CustomButtonConvert(label: 'Chuyển', onPress: onPress, size: size);
  }
  factory CustomButtonConvert.resistor(VoidCallback onPress, Size size) {
    return CustomButtonConvert(label: 'Tra', onPress: onPress, size: size);
  }

}
