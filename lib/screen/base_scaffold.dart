import 'package:calculator/constant/image_constant.dart';
import 'package:calculator/constant/text_style_constant.dart';
import 'package:calculator/screen/calculator/calculator_basic_screen.dart';
import 'package:calculator/screen/converter/converter_screen.dart';
import 'package:calculator/screen/hex_rgb/hex_rgb_screen.dart';
import 'package:calculator/screen/resistor/resistor_screen.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final Widget body;
  final TabBar? tabBar;
  const BaseScaffold({super.key, required this.body, this.tabBar});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  final GlobalKey<ScaffoldState> _calculatorKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _calculatorKey,
        extendBodyBehindAppBar: true,
        drawer: _drawer(context),
        appBar: AppBar(
          bottom:widget.tabBar,
          centerTitle: true,
          title: Text(
            'Wibulator',
            style: TextStyleConstant.titleAppBar,
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu, size: 40),
            onPressed: () {
              _calculatorKey.currentState?.openDrawer();
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        body: widget.body,
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      color: Colors.black,
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.headerDrawer),
                      fit: BoxFit.cover)),
              child: const Text('')),
          ListTile(
            title: const Center(
              child: Text(
                'Máy tính cơ bản',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const CalculatorScreen())));
            },
          ),
          _divider(),
          ListTile(
            title: const Center(
              child: Text(
                'Chuyển đổi cơ số',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ConverterScreen())));
            },
          ),
          _divider(),
          ListTile(
            title: const Center(
              child: Text(
                'Tính mã màu điện trở',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ResistorScreen())));
            },
          ),
          _divider(),
          ListTile(
            title: const Center(
              child: Text(
                'HEX <=> RGB',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const HexAndRGBScreen())));
            },
          ),
          _divider(),
        ],
      ),
    );
  }
}
