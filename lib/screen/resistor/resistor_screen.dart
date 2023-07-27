import 'package:calculator/constant/image_constant.dart';
import 'package:calculator/screen/base_scaffold.dart';
import 'package:calculator/screen/resistor/body.dart';
import 'package:calculator/widgets/dropDown/dung_sai_drop_down_btn.dart';
import 'package:calculator/widgets/dropDown/multipler_drop_down_btn.dart';
import 'package:calculator/widgets/dropDown/ppm_drop_down_btn.dart';
import 'package:calculator/widgets/dropDown/resistor_drop_down_btn.dart';
import 'package:flutter/cupertino.dart';

class ResistorScreen extends StatefulWidget {
  const ResistorScreen({super.key});

  @override
  State<ResistorScreen> createState() => ResistorScreenState();
}

class ResistorScreenState extends State<ResistorScreen> {
  final keySelectNumberOfColor1 = GlobalKey<ResistorDropDownButtonState>();
  final keySelectNumberOfColor2 = GlobalKey<ResistorDropDownButtonState>();
  final keySelectNumberOfColor3 = GlobalKey<ResistorDropDownButtonState>();
  final keySelectNumberOfColor4 = GlobalKey<ResistorDropDownButtonState>();
  final keyMultiplier = GlobalKey<MultiplierDropDownButtonState>();
  final keyDungSai = GlobalKey<DungSaiDropDownButtonState>();
  final keyPPM = GlobalKey<PPMDropDownButtonState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage(ImageConstant.background3),
                    fit: BoxFit.cover)),
          ),
          BodyOfResistorScreen(
            keyPPM: keyPPM,
            keyMultiplier: keyMultiplier,
            keySelectNumberOfColor1: keySelectNumberOfColor1,
            keySelectNumberOfColor2: keySelectNumberOfColor2,
            keySelectNumberOfColor3: keySelectNumberOfColor3,
            keySelectNumberOfColor4: keySelectNumberOfColor4,
            size: size,
            keyDungSai: keyDungSai,
          )
        ]),
      ),
    );
  }
}
