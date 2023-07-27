import 'package:calculator/constant/image_constant.dart';
import 'package:calculator/logic/converter/logic_converter.dart';
import 'package:calculator/screen/base_scaffold.dart';
import 'package:calculator/screen/converter/body.dart';

import 'package:calculator/widgets/dropDown/convert_drop_down_btn.dart';
import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final inputController = TextEditingController();
  final outputController = TextEditingController();
  final keyConvertFrom = GlobalKey<ConvertDropDownButtonState>();
  final keyConvertTo = GlobalKey<ConvertDropDownButtonState>();

  final String backgroundImage = ImageConstant.background2;
  int inputId = 2;
  int outputId = 10;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover)),
              ),
              BodyOfConvertScreen(
                inputController: inputController,
                keyConvertFrom: keyConvertFrom,
                keyConvertTo: keyConvertTo,
                onPressed: onPressed,
                outputController: outputController,
                size: size,
              )
            ],
          ),
        ),
      ),
    );
  }

  setNumber(value) {
    switch (value) {
      case 'Nhị Phân':
        return 2;
      case 'Bát Phân':
        return 8;
      case 'Thập Phân':
        return 10;
      case 'Thập Lục Phân':
        return 16;
    }
  }

  onPressed() {
    setState(() {
      inputId = setNumber(keyConvertFrom.currentState?.selectedValue.title);
      outputId = setNumber(keyConvertTo.currentState?.selectedValue.title);
      outputController.text =
          LogicCovert.convertNumber(inputController.text, outputId, inputId);
    });
  }
}
