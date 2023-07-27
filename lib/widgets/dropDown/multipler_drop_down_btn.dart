import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class MultiplierDropDownButton extends StatefulWidget {
  const MultiplierDropDownButton({
    super.key,
  });

  @override
  State<MultiplierDropDownButton> createState() =>
      MultiplierDropDownButtonState();
}

class MultiplierDropDownButtonState extends State<MultiplierDropDownButton> {
  final TextStyle textStyle = TextStyleConstant.textDropButton3;
  MultiplierColorType selectedValue = MultiplierColorType.none;

  onChanged(MultiplierColorType? value) {
    setState(() {
      selectedValue = value ?? MultiplierColorType.none;
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
      child: DropdownButton<MultiplierColorType>(
        value: selectedValue,
        elevation: 24,
        style: textStyle,
        iconSize: 30,
        onChanged: onChanged,
        items: MultiplierColorType.values
            .map<DropdownMenuItem<MultiplierColorType>>((item) {
          return DropdownMenuItem<MultiplierColorType>(
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

enum MultiplierColorType {
  none,
  silver,
  gold,
  black,
  brown,
  red,
  orange,
  yellow,
  green,
  blue,
  purple;

  String get title {
    switch (this) {
      case MultiplierColorType.none:
        return 'Màu';
      case MultiplierColorType.silver:
        return 'Bạc (0.01Ω)';
      case MultiplierColorType.gold:
        return 'Vàng kim (0.1Ω)';
      case MultiplierColorType.black:
        return 'Đen (1Ω)';
      case MultiplierColorType.brown:
        return 'Nâu (10Ω)';
      case MultiplierColorType.red:
        return 'Đỏ (100Ω)';
      case MultiplierColorType.orange:
        return 'Cam (1kΩ)';
      case MultiplierColorType.yellow:
        return 'Vàng (10kΩ)';
      case MultiplierColorType.green:
        return 'Lục (100kΩ)';
      case MultiplierColorType.blue:
        return 'Lam (1MΩ)';
      case MultiplierColorType.purple:
        return 'Tím (10MΩ)';
    }
  }
}
