import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class PPMDropDownButton extends StatefulWidget {
  const PPMDropDownButton({
    super.key,
  });

  @override
  State<PPMDropDownButton> createState() => PPMDropDownButtonState();
}

class PPMDropDownButtonState extends State<PPMDropDownButton> {
  final TextStyle textStyle = TextStyleConstant.textDropButton3;
  PPMColorType selectedValue = PPMColorType.none;

  onChanged(PPMColorType? value) {
    setState(() {
      selectedValue = value ?? PPMColorType.none;
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
      child: DropdownButton<PPMColorType>(
        value: selectedValue,
        elevation: 24,
        style: textStyle,
        iconSize: 30,
        onChanged: onChanged,
        items: PPMColorType.values.map<DropdownMenuItem<PPMColorType>>((item) {
          return DropdownMenuItem<PPMColorType>(
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

enum PPMColorType {
  none,

  brown,
  red,
  orange,
  yellow;

  String get title {
    switch (this) {
      case PPMColorType.none:
        return 'Màu';
      case PPMColorType.brown:
        return 'Nâu (100 ppm)';
      case PPMColorType.red:
        return 'Đỏ (50 ppm)';
      case PPMColorType.orange:
        return 'Cam (15 ppm)';
      case PPMColorType.yellow:
        return 'Vàng (25 ppm)';
    }
  }
}
