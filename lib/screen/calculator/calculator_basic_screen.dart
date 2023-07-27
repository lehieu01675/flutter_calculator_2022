import 'package:calculator/constant/color_constant.dart';
import 'package:calculator/constant/image_constant.dart';
import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/logic/calculator/logic_calculator_basic.dart';
import 'package:calculator/screen/base_scaffold.dart';

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = '';
  dynamic text = '';
  double numOne = 0;
  double numTwo = 0;
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  dynamic ans = '';

  LinearGradient backgroundColor = ColorConstant.backGroundColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
        body: Stack(children: [
      // background
      Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.6,
                image: AssetImage(
                  ImageConstant.background1,
                ),
                fit: BoxFit.cover)),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.4,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(text,
                            style: (text.length < 8)
                                ? TextStyleConstant.textResult1
                                : TextStyleConstant.textResult2),
                        Text(
                          opr.toString().contains('=') ? '' : '$opr',
                          style: TextStyleConstant.opr,
                        )
                      ]),
                    ]),
              ),
              // keyboard
              const Divider(
                  height: 5,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Color.fromARGB(255, 65, 63, 63)),
              const SizedBox(height: 10),
              keyBoard(size)
            ]),
          ))
    ]));
  }

  Widget keyBoard(Size size) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          customButton(size, 'CE', ColorConstant.whiteButton,
              Image(image: AssetImage(ImageConstant.ce))),
          customButton(size, '/', ColorConstant.whiteButton,
              Text('/', style: TextStyleConstant.textButton)),
          customButton(size, '*', ColorConstant.whiteButton,
              Text('*', style: TextStyleConstant.textButton)),
          customButton(size, 'DE', ColorConstant.whiteButton,
              Image(image: AssetImage(ImageConstant.backSpace))),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          customButton(size, '7', ColorConstant.whiteButton,
              Text('7', style: TextStyleConstant.textButton)),
          customButton(size, '8', ColorConstant.whiteButton,
              Text('8', style: TextStyleConstant.textButton)),
          customButton(size, '9', ColorConstant.whiteButton,
              Text('9', style: TextStyleConstant.textButton)),
          customButton(size, '-', ColorConstant.whiteButton,
              Text('-', style: TextStyleConstant.textButton)),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          customButton(size, '4', ColorConstant.whiteButton,
              Text('4', style: TextStyleConstant.textButton)),
          customButton(size, '5', ColorConstant.whiteButton,
              Text('5', style: TextStyleConstant.textButton)),
          customButton(size, '6', ColorConstant.whiteButton,
              Text('6', style: TextStyleConstant.textButton)),
          customButton(size, '+', ColorConstant.whiteButton,
              Text('+', style: TextStyleConstant.textButton)),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          customButton(size, '1', ColorConstant.whiteButton,
              Text('1', style: TextStyleConstant.textButton)),
          customButton(size, '2', ColorConstant.whiteButton,
              Text('2', style: TextStyleConstant.textButton)),
          customButton(size, '3', ColorConstant.whiteButton,
              Text('3', style: TextStyleConstant.textButton)),
          customButton(size, '%', ColorConstant.whiteButton,
              Text('%', style: TextStyleConstant.textButton)),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          customButton(size, '0', ColorConstant.whiteButton,
              Text('0', style: TextStyleConstant.textButton)),
          customButton(size, '.', ColorConstant.whiteButton,
              Text('.', style: TextStyleConstant.textButton)),
          customButton(size, '$ans', ColorConstant.whiteButton,
              Image(image: AssetImage(ImageConstant.ans))),
          customButton(size, '=', ColorConstant.whiteButton,
              Text('=', style: TextStyleConstant.textButton)),
        ]),
      ],
    );
  }

  Widget customButton(Size size, String input, Color color, Widget child) {
    return SizedBox(
      width: size.width * 0.22,
      height: size.height * 0.08,
      child: ElevatedButton(
          onPressed: () => calculation(input),
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: color),
          child: child),
    );
  }

  calculation(input) {
    if (input == 'DE') {
      setState(() {
        finalResult = finalResult.substring(0, finalResult.length - 1);
        result = finalResult;
      });
    } else if (input == 'CE') {
      text = '';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    } else if (input == '+' ||
        input == '-' ||
        input == '*' ||
        input == '/' ||
        input == '=' ||
        input == '%') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else if (numTwo == 0) {
        numTwo = double.parse(result);
      } else {
        ans = double.parse(result);
      }

      if (opr == '+') {
        finalResult = LogicCalculator.add(result, numOne, numTwo);
        ans = finalResult;
        numOne = numTwo = 0;
      } else if (opr == '-') {
        finalResult = LogicCalculator.sub(result, numOne, numTwo);
        ans = finalResult;
        numOne = numTwo = 0;
      } else if (opr == '*') {
        finalResult = LogicCalculator.mul(result, numOne, numTwo);
        ans = finalResult;
        numOne = numTwo = 0;
      } else if (opr == '/') {
        finalResult = LogicCalculator.div(result, numOne, numTwo);
        ans = finalResult;
        numOne = numTwo = 0;
      } else if (opr == '%') {
        finalResult = LogicCalculator.divRemainder(result, numOne, numTwo);
        ans = finalResult;
        numOne = numTwo = 0;
      }
      preOpr = opr;
      opr = input;
      result = '';
    } else if (input == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else {
      result = result + input;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }
}
