import 'package:calculator/constant/color_constant.dart';
import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/widgets/custom_btn_chuyen.dart';
import 'package:calculator/widgets/custom_input_convert.dart';
import 'package:calculator/widgets/dropDown/convert_drop_down_btn.dart';
import 'package:flutter/material.dart';

class BodyOfConvertScreen extends StatefulWidget {
  final GlobalKey<ConvertDropDownButtonState> keyConvertFrom;
  final GlobalKey<ConvertDropDownButtonState> keyConvertTo;
  final TextEditingController inputController;
  final TextEditingController outputController;
  final VoidCallback onPressed;
  final Size size;
  const BodyOfConvertScreen(
      {super.key,
      required this.keyConvertFrom,
      required this.keyConvertTo,
      required this.inputController,
      required this.outputController,
      required this.size,
      required this.onPressed});

  @override
  State<BodyOfConvertScreen> createState() => _BodyOfConvertScreenState();
}

class _BodyOfConvertScreenState extends State<BodyOfConvertScreen> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConvertDropDownButton(
              key: widget.keyConvertFrom,
              backGroundColor: ColorConstant.dropDownButton1,
              dropdownColor: ColorConstant.dropDownButton1,
            ),
          ),
          const SizedBox(height: 20),
          InputConvert.input(widget.inputController, 'Giá trị cần chuyển đổi',
              TextInputType.text),
          const Center(
              child: Icon(
            Icons.arrow_downward,
            size: 100,
            color: Colors.white,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConvertDropDownButton(
              key: widget.keyConvertTo,
              backGroundColor: ColorConstant.dropDownButton2,
              dropdownColor: ColorConstant.dropDownButton2,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: widget.size.height * 0.1,
            // ignore: unnecessary_string_interpolations
            child: Text('${widget.outputController.text}',
                style: (widget.outputController.text.toString().length < 8)
                    ? TextStyleConstant.textResult1
                    : TextStyleConstant.textResult2),
          ),
          const Divider(
              height: 5,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Color.fromARGB(255, 65, 63, 63)),
          const SizedBox(height: 20),
          CustomButtonConvert.convert(widget.onPressed, widget.size),
        ],
      ),
    );
  }
}
