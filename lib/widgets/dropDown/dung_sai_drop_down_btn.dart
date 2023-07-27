import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class DungSaiDropDownButton extends StatefulWidget {
  const DungSaiDropDownButton({
    super.key,
  });

  @override
  State<DungSaiDropDownButton> createState() => DungSaiDropDownButtonState();
}

class DungSaiDropDownButtonState extends State<DungSaiDropDownButton> {
  final TextStyle textStyle = TextStyleConstant.textDropButton3;
  DungSaiColorType selectedValue = DungSaiColorType.none;

  onChanged(DungSaiColorType? value) {
    setState(() {
      selectedValue = value ?? DungSaiColorType.none;
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
      child: DropdownButton<DungSaiColorType>(
        value: selectedValue,
        elevation: 24,
        style: textStyle,
        iconSize: 30,
        onChanged: onChanged,
        items: DungSaiColorType.values
            .map<DropdownMenuItem<DungSaiColorType>>((item) {
          return DropdownMenuItem<DungSaiColorType>(
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

enum DungSaiColorType {
  none,
  silver,
  gold,
  brown,
  red,
  green,
  blue,
  purple;

  String get title {
    switch (this) {
      case DungSaiColorType.none:
        return 'Màu';
      case DungSaiColorType.silver:
        return 'Bạc (± 10%)';
      case DungSaiColorType.gold:
        return 'Vàng kim (± 5%)';

      case DungSaiColorType.brown:
        return 'Nâu (± 1%)';
      case DungSaiColorType.red:
        return 'Đỏ (± 2%)';
      case DungSaiColorType.green:
        return 'Lục (± 0.5%)';
      case DungSaiColorType.blue:
        return 'Lam (± 0.25%)';
      case DungSaiColorType.purple:
        return 'Tím (± 0.1%)';
    }
  }
}
