import 'package:calculator/constant/text_style_constant.dart';
import 'package:flutter/material.dart';

class ConvertDropDownButton extends StatefulWidget {
  final Color backGroundColor;
  final Color dropdownColor;

  const ConvertDropDownButton({
    super.key,
    required this.backGroundColor,
    required this.dropdownColor,
  });

  @override
  State<ConvertDropDownButton> createState() => ConvertDropDownButtonState();
}

class ConvertDropDownButtonState extends State<ConvertDropDownButton> {
  final TextStyle textStyle = TextStyleConstant.textDropButton;
  ConvertType selectedValue = ConvertType.birary;

  onChanged(ConvertType? value) {
    setState(() {
      selectedValue = value ?? ConvertType.birary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: widget.backGroundColor,
          borderRadius: BorderRadius.circular(30)),
      child: DropdownButton<ConvertType>(
        value: selectedValue,
        elevation: 24,
        style: textStyle,
        iconSize: 30,
        underline: Divider(
          height: 10,
          indent: 10,
          endIndent: 10,
          color: Colors.black.withOpacity(0.8),
        ),
        onChanged: onChanged,
        items: ConvertType.values.map<DropdownMenuItem<ConvertType>>((item) {
          return DropdownMenuItem<ConvertType>(
            value: item,
            child: Center(child: Text(item.title)),
          );
        }).toList(),
        dropdownColor: widget.dropdownColor,
        borderRadius: BorderRadius.circular(30),
        isExpanded: true,
      ),
    );
  }
}

enum ConvertType {
  birary,
  octal,
  decimal,
  hexadecimal;

  String get title {
    switch (this) {
      case ConvertType.birary:
        return 'Nhị Phân';
      case ConvertType.octal:
        return 'Bát Phân';
      case ConvertType.decimal:
        return 'Thập Phân';
      case ConvertType.hexadecimal:
        return 'Thập Lục Phân';
    }
  }
}
