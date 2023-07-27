import 'package:calculator/constant/image_constant.dart';
import 'package:calculator/screen/base_scaffold.dart';
import 'package:calculator/screen/hex_rgb/body_hex_to_rgb.dart';
import 'package:calculator/screen/hex_rgb/body_rgb_to_hex.dart';
import 'package:flutter/material.dart';

class HexAndRGBScreen extends StatefulWidget {
  const HexAndRGBScreen({super.key});

  @override
  State<HexAndRGBScreen> createState() => _HexAndRGBScreenState();
}

class _HexAndRGBScreenState extends State<HexAndRGBScreen> {
  final List<Tab> _listTab = [
    const Tab(
        child: Text('HEX -> RGB',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
    const Tab(
        child: Text('RGB -> HEX',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _listTab.length,
        child: Builder(builder: (BuildContext context) {
          final TabController? tabController = DefaultTabController.of(context);
          tabController!.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return BaseScaffold(
              tabBar: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black.withOpacity(0.4),
                indicatorColor: Colors.transparent,
                tabs: _listTab,
              ),
              body: Stack(children: [
                SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.5,
                            image: AssetImage(ImageConstant.background4),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TabBarView(children: [
                    SingleChildScrollView(
                        child: BodyOfHexToRGBScreeen(size: size)),
                    SingleChildScrollView(
                        child: BodyOfRGBToHexScreeen(size: size))
                  ]),
                ),
              ]));
        }));
  }
}
