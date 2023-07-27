import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/logic/hex_rgb/logic_hex_rgb.dart';
import 'package:calculator/widgets/custom_btn_chuyen.dart';
import 'package:calculator/widgets/custom_input_convert.dart';
import 'package:calculator/widgets/show_color_hex_rgb.dart';
import 'package:flutter/material.dart';

class BodyOfHexToRGBScreeen extends StatefulWidget {
  const BodyOfHexToRGBScreeen({super.key, required this.size});
  final Size size;

  @override
  State<BodyOfHexToRGBScreeen> createState() => _BodyOfHexToRGBScreeenState();
}

class _BodyOfHexToRGBScreeenState extends State<BodyOfHexToRGBScreeen> {
  final inputController = TextEditingController();
  RGB rbg = RGB(255, 255, 255);
  String r = '', g = '', b = '';
  String cssColor = '';
  String showColor = '';
  String replaceCodeColor = '';

  onPressed() {
    setState(() {
      rbg = LogicHexAndRGB.hexToRgb(inputController.text);
      r = rbg.r.toString();
      g = rbg.g.toString();
      b = rbg.b.toString();
      cssColor = 'RGB(${r}, ${g}, ${b})';
      replaceCodeColor = inputController.text;
      if (replaceCodeColor.startsWith('#')) {
        replaceCodeColor = replaceCodeColor.substring(1);
      }
      showColor = '0xff${replaceCodeColor}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 120),
      InputConvert.input(
        inputController,
        'Mã màu HEX (#RRGGBB)',
        TextInputType.text,
      ),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _rowValueOfColor(
              'Red (R)', r, TextStyleConstant.inputInputConvert)),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _rowValueOfColor(
              'Green (G)', g, TextStyleConstant.inputInputConvert)),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _rowValueOfColor(
              'Blue (B)', b, TextStyleConstant.inputInputConvert)),
      const SizedBox(height: 10),
      Center(
          child:
              Text('Mã màu RGB', style: TextStyleConstant.inputInputConvert)),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white.withOpacity(0.6),
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(cssColor, style: TextStyleConstant.inputInputConvert),
          ]),
        ),
      ),
      const SizedBox(height: 20),
      Center(
          child:
              Text('Màu hiển thị', style: TextStyleConstant.inputInputConvert)),
      ShowColorHexRgb(colorCode: showColor),
      const SizedBox(height: 10),
      CustomButtonConvert.resistor(onPressed, widget.size)
    ]);
  }

  Widget _rowValueOfColor(String color, String result, TextStyle resultStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(color, style: TextStyleConstant.inputInputConvert),
        const SizedBox(width: 50),
        Flexible(
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.6),
                border: Border.all(),
                borderRadius: BorderRadius.circular(5)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(result, style: resultStyle),
            ]),
          ),
        )
      ],
    );
  }
}
