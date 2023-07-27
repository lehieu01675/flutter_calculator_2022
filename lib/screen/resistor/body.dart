import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/logic/resistor/logic_resistor.dart';
import 'package:calculator/logic/resistor/set_value.dart';
import 'package:calculator/widgets/custom_btn_chuyen.dart';
import 'package:calculator/widgets/custom_input_convert.dart';
import 'package:calculator/widgets/dropDown/dung_sai_drop_down_btn.dart';
import 'package:calculator/widgets/dropDown/multipler_drop_down_btn.dart';
import 'package:calculator/widgets/dropDown/ppm_drop_down_btn.dart';
import 'package:calculator/widgets/dropDown/resistor_drop_down_btn.dart';
import 'package:calculator/widgets/show_color_resistor.dart';
import 'package:flutter/material.dart';

class BodyOfResistorScreen extends StatefulWidget {
  final GlobalKey<ResistorDropDownButtonState> keySelectNumberOfColor1;
  final GlobalKey<ResistorDropDownButtonState> keySelectNumberOfColor2;
  final GlobalKey<ResistorDropDownButtonState> keySelectNumberOfColor3;
  final GlobalKey<ResistorDropDownButtonState> keySelectNumberOfColor4;

  final GlobalKey<MultiplierDropDownButtonState> keyMultiplier;
  final GlobalKey<DungSaiDropDownButtonState> keyDungSai;
  final GlobalKey<PPMDropDownButtonState> keyPPM;
  final Size size;
  const BodyOfResistorScreen(
      {super.key,
      required this.keySelectNumberOfColor1,
      required this.keySelectNumberOfColor2,
      required this.keySelectNumberOfColor3,
      required this.keySelectNumberOfColor4,
      required this.size,
      required this.keyMultiplier,
      required this.keyDungSai,
      required this.keyPPM});

  @override
  State<BodyOfResistorScreen> createState() => BodyOfResistorScreenState();
}

class BodyOfResistorScreenState extends State<BodyOfResistorScreen> {
  final countOfColor = TextEditingController();
  String text = '0';
  int valueOfButton1 = 0;
  int valueOfButton2 = 0;
  int valueOfButton3 = 0;
  int valueOfButton4 = 0;
  int valueOfMultiplier = 0;
  int valueOfDungSai = 0;
  String valueOfPPM = '';

  Color line1 = Colors.transparent;
  Color line2 = Colors.transparent;
  Color line3 = Colors.transparent;
  Color line4 = Colors.transparent;
  Color line5 = Colors.transparent;
  Color line6 = Colors.transparent;

  onPressInWhatColor() {
    line1 = SetValueResistor.setColorOfContainerForColorButton(
        widget.keySelectNumberOfColor1.currentState?.selectedValue.title);
    line2 = SetValueResistor.setColorOfContainerForColorButton(
        widget.keySelectNumberOfColor2.currentState?.selectedValue.title);

    valueOfButton1 = SetValueResistor.setValue(
        widget.keySelectNumberOfColor1.currentState?.selectedValue.title);
    valueOfButton2 = SetValueResistor.setValue(
        widget.keySelectNumberOfColor2.currentState?.selectedValue.title);
    String? s3 =
        widget.keySelectNumberOfColor3.currentState?.selectedValue.title;
    String? s4 = widget.keyPPM.currentState?.selectedValue.title;
    if (s3 == null && s4 == null) {
      line3 = SetValueResistor.setColorOfContainerForMulti(
          widget.keyMultiplier.currentState?.selectedValue.title);
      line4 = SetValueResistor.setColorOfContainerForDungSai(
          widget.keyDungSai.currentState?.selectedValue.title);
      valueOfMultiplier = SetValueResistor.setMultiplier(
          widget.keyMultiplier.currentState?.selectedValue.title);
      valueOfDungSai = SetValueResistor.setDungSai(
          widget.keyDungSai.currentState?.selectedValue.title);
      text = LogicResistor.fourColor(
          valueOfButton1, valueOfButton2, valueOfMultiplier, valueOfDungSai);
    } else {
      line3 = SetValueResistor.setColorOfContainerForColorButton(
          widget.keySelectNumberOfColor3.currentState?.selectedValue.title);
      line4 = SetValueResistor.setColorOfContainerForMulti(
          widget.keyMultiplier.currentState?.selectedValue.title);
      line5 = SetValueResistor.setColorOfContainerForDungSai(
          widget.keyDungSai.currentState?.selectedValue.title);

      valueOfButton3 = SetValueResistor.setValue(
          widget.keySelectNumberOfColor3.currentState?.selectedValue.title);
      valueOfMultiplier = SetValueResistor.setMultiplier(
          widget.keyMultiplier.currentState?.selectedValue.title);
      valueOfDungSai = SetValueResistor.setDungSai(
          widget.keyDungSai.currentState?.selectedValue.title);

      if (s4 == null) {
        text = LogicResistor.fiveColor(valueOfButton1, valueOfButton2,
            valueOfButton3, valueOfMultiplier, valueOfDungSai);
      } else {
        line6 = SetValueResistor.setColorOfContainerForPPM(
            widget.keyPPM.currentState?.selectedValue.title);
        valueOfPPM = SetValueResistor.setPPM(
            widget.keyPPM.currentState?.selectedValue.title);
        text = LogicResistor.fiveColor(valueOfButton1, valueOfButton2,
                valueOfButton3, valueOfMultiplier, valueOfDungSai) +
            // ignore: unnecessary_brace_in_string_interps
            ' ${valueOfPPM}';
      }
    }
  }

  onPressed() {
    setState(() {
      if (int.parse(countOfColor.text) > 6) {
        countOfColor.text = '6';
      } else if (int.parse(countOfColor.text) < 4) {
        countOfColor.text = '4';
      }
      onPressInWhatColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              InputConvert.input(countOfColor, 'Số vòng màu của điện trở',
                  TextInputType.number),
              const SizedBox(height: 20),
              if (countOfColor.text == '4') ...[
                _rowTitle('Dải 1', 'Dải 2'),
                _rowDropDownButton(widget.keySelectNumberOfColor1,
                    widget.keySelectNumberOfColor2),
                _rowTitle('Dải 3', 'Dải 4'),
                Row(children: [
                  Expanded(
                    child: MultiplierDropDownButton(key: widget.keyMultiplier),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: DungSaiDropDownButton(key: widget.keyDungSai))
                ]),
              ],
              if (countOfColor.text == '5') ...[
                _rowTitle('Dải 1', 'Dải 2'),
                _rowDropDownButton(widget.keySelectNumberOfColor1,
                    widget.keySelectNumberOfColor2),
                _rowTitle('Dải 3', 'Dải 4'),
                Row(children: [
                  Expanded(
                    child: ResistorDropDownButton(
                      key: widget.keySelectNumberOfColor3,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MultiplierDropDownButton(
                      key: widget.keyMultiplier,
                    ),
                  ),
                ]),
                Center(
                  child: Text('Dải 5',
                      style: TextStyleConstant.resistorColorTitle),
                ),
                DungSaiDropDownButton(
                  key: widget.keyDungSai,
                )
              ],
              // multiplier
              if (countOfColor.text == '6') ...[
                _rowTitle('Dải 1', 'Dải 2'),
                _rowDropDownButton(widget.keySelectNumberOfColor1,
                    widget.keySelectNumberOfColor2),
                _rowTitle('Dải 3', 'Dải 4'),
                Row(children: [
                  Expanded(
                    child: ResistorDropDownButton(
                      key: widget.keySelectNumberOfColor3,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MultiplierDropDownButton(
                      key: widget.keyMultiplier,
                    ),
                  ),
                ]),
                _rowTitle('Dải 5', 'Dải 6'),
                Row(
                  children: [
                    Expanded(
                        child: DungSaiDropDownButton(key: widget.keyDungSai)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: PPMDropDownButton(
                      key: widget.keyPPM,
                    ))
                  ],
                )
              ],

              const SizedBox(height: 10),
              Text(text, style: TextStyleConstant.resisterResult),

              const Divider(
                  height: 5,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Color.fromARGB(255, 65, 63, 63)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ShowColorResistor(
                    count: countOfColor.text,
                    line1: line1,
                    line2: line2,
                    line3: line3,
                    line4: line4,
                    line5: line5,
                    line6: line6,
                    size: widget.size),
              ),
              const SizedBox(height: 10),
              CustomButtonConvert.resistor(onPressed, widget.size),
              //CustomButtonConvert.resistor(onPressed, size),
            ],
          ),
        ));
  }

  Widget _rowTitle(String s1, String s2) {
    return Row(children: [
      Expanded(
          child: Center(
        child: Text(s1, style: TextStyleConstant.resistorColorTitle),
      )),
      Expanded(
          child: Center(
        child: Text(s2, style: TextStyleConstant.resistorColorTitle),
      )),
    ]);
  }

  Widget _rowDropDownButton(GlobalKey<ResistorDropDownButtonState> k1,
      GlobalKey<ResistorDropDownButtonState> k2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ResistorDropDownButton(
            key: k1,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ResistorDropDownButton(
            key: k2,
          ),
        ),
      ],
    );
  }
}
