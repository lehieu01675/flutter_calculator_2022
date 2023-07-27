import 'package:flutter/material.dart';

class ShowColorHexRgb extends StatefulWidget {
  final String colorCode;
  const ShowColorHexRgb({super.key, required this.colorCode});

  @override
  State<ShowColorHexRgb> createState() => _ShowColorHexRgbState();
}

class _ShowColorHexRgbState extends State<ShowColorHexRgb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (widget.colorCode.isEmpty)
              ? Colors.transparent
              : Color(int.parse(widget.colorCode))),
    );
  }
}
