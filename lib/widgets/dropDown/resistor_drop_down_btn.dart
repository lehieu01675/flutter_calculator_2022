import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class ResistorDropDownButton extends StatefulWidget {
  const ResistorDropDownButton({
    super.key,
  });

  @override
  State<ResistorDropDownButton> createState() => ResistorDropDownButtonState();
}

class ResistorDropDownButtonState extends State<ResistorDropDownButton> {
  final TextStyle textStyle = TextStyleConstant.textDropButton3;
  ColorType selectedValue = ColorType.none;

  onChanged(ColorType? value) {
    setState(() {
      selectedValue = value ?? ColorType.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: DropdownButton<ColorType>(
        value: selectedValue,
        elevation: 24,
        style: textStyle,
        iconSize: 30,
        onChanged: onChanged,
        items: ColorType.values.map<DropdownMenuItem<ColorType>>((item) {
          return DropdownMenuItem<ColorType>(
            value: item,
            child: Center(child: Text(item.title)),
          );
        }).toList(),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
      ),
    );
  }
}

enum ColorType {
  none,
  black,
  brown,
  red,
  orange,
  yellow,
  green,
  blue,
  purple,
  grey,
  white;

  String get title {
    switch (this) {
      case ColorType.none:
        return 'Màu';
      case ColorType.black:
        return 'Đen (0)';
      case ColorType.brown:
        return 'Nâu (1)';
      case ColorType.red:
        return 'Đỏ (2)';
      case ColorType.orange:
        return 'Cam (3)';
      case ColorType.yellow:
        return 'Vàng (4)';
      case ColorType.green:
        return 'Lục (5)';
      case ColorType.blue:
        return 'Lam (6)';
      case ColorType.purple:
        return 'Tím (7)';
      case ColorType.grey:
        return 'Xám (8)';
      case ColorType.white:
        return 'Trắng (9)';
    }
  }
}
