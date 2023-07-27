import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/logic/hex_rgb/logic_hex_rgb.dart';
import 'package:calculator/widgets/custom_btn_chuyen.dart';
import 'package:calculator/widgets/custom_input_convert.dart';
import 'package:calculator/widgets/show_color_hex_rgb.dart';
import 'package:flutter/material.dart';

class BodyOfRGBToHexScreeen extends StatefulWidget {
  const BodyOfRGBToHexScreeen({super.key, required this.size});
  final Size size;

  @override
  State<BodyOfRGBToHexScreeen> createState() => _BodyOfRGBToHexScreeenState();
}

class _BodyOfRGBToHexScreeenState extends State<BodyOfRGBToHexScreeen> {
  final inputController1 = TextEditingController();
  final inputController2 = TextEditingController();
  final inputController3 = TextEditingController();

  String showColor = '';
  String codeColorHex = '';
  String codeColorRGB = '';
  String replaceCode = '';
  int value1 = 0, value2 = 0, value3 = 0;
  RGB rgb = RGB(0, 0, 0);

  setValueIn255(int value) {
    if (value > 255) {
      return 255;
    } else if (value < 0) {
      return 0;
    } else {
      return value;
    }
  }

  onPressed() {
    setState(() {
      value1 = setValueIn255(int.parse(inputController1.text));
      value2 = setValueIn255(int.parse(inputController2.text));
      value3 = setValueIn255(int.parse(inputController3.text));
      rgb.r = value1;
      rgb.g = value2;
      rgb.b = value3;
      codeColorHex = LogicHexAndRGB.rgbToHex(rgb);
      codeColorRGB = 'RGB(${value1}, ${value2}, ${value3})';
      replaceCode = codeColorHex.substring(1, codeColorHex.length);
      showColor = '0xff${replaceCode}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 120),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _rowValueOfColor('Red (R)', inputController1)),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _rowValueOfColor('Green (G)', inputController2)),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _rowValueOfColor('Blue (B)', inputController3)),
      const SizedBox(height: 10),
      _rowValueOfHex(
          'Mã màu HEX', codeColorHex, TextStyleConstant.inputInputConvert),
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
            Text(codeColorRGB, style: TextStyleConstant.inputInputConvert),
          ]),
        ),
      ),
      const SizedBox(height: 20),
      Center(
          child:
              Text('Màu hiển thị', style: TextStyleConstant.inputInputConvert)),
      const SizedBox(height: 10),
      ShowColorHexRgb(colorCode: showColor),
      const SizedBox(height: 10),
      CustomButtonConvert.resistor(onPressed, widget.size)
    ]);
  }

  Widget _rowValueOfHex(
    String title,
    String result,
    TextStyle resultStyle,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyleConstant.inputInputConvert),
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

  Widget _rowValueOfColor(
    String text,
    TextEditingController controller,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyleConstant.inputInputConvert),
        const SizedBox(width: 50),
        Flexible(
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.6),
                border: Border.all(),
                borderRadius: BorderRadius.circular(5)),
            child: InputConvert.input(controller, '', TextInputType.number),
          ),
        )
      ],
    );
  }
}
