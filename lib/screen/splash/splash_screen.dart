import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calculator/constant/image_constant.dart';
import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/screen/calculator/calculator_basic_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  final String _splashIcon = ImageConstant.splashIcon;
  final TextStyle _logoTextStyle = TextStyleConstant.appName;
  final String _name = 'Wibulator';

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
        duration: 1500,
        splash: Column(
          children: [
            SizedBox(
                width: size.width,
                height: size.height * 0.3,
                child: Lottie.asset(_splashIcon)),
            Text(_name, style: _logoTextStyle),
          ],
        ),
        animationDuration: const Duration(seconds: 1),
        pageTransitionType: PageTransitionType.bottomToTop,
        // splashTransition: SplashTransition.,
        splashIconSize: 400,
        backgroundColor: const Color(0xff8E97FD),
        nextScreen: const CalculatorScreen());
  }
}
