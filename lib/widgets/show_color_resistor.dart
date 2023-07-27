import 'package:flutter/material.dart';

class ShowColorResistor extends StatefulWidget {
  final Size size;
  final String count;
  final Color line1;
  final Color line2;
  final Color line3;
  final Color line4;
  final Color line5;
  final Color line6;
  const ShowColorResistor(
      {super.key,
      required this.size,
      required this.line1,
      required this.line2,
      required this.line3,
      required this.line4,
      required this.line5,
      required this.line6,
      required this.count});

  @override
  State<ShowColorResistor> createState() => _ShowColorResistorState();
}

class _ShowColorResistorState extends State<ShowColorResistor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      width: widget.size.width,
      height: widget.size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 5),
          if (widget.count == '4') ...[
            _childContainer(widget.line1),
            _childContainer(widget.line2),
            _childContainer(widget.line3),
            _childContainer(widget.line4),
          ],
          if (widget.count == '5') ...[
            _childContainer(widget.line1),
            _childContainer(widget.line2),
            _childContainer(widget.line3),
            _childContainer(widget.line4),
            _childContainer(widget.line5),
          ],
          if (widget.count == '6') ...[
            _childContainer(widget.line1),
            _childContainer(widget.line2),
            _childContainer(widget.line3),
            _childContainer(widget.line4),
            _childContainer(widget.line5),
            _childContainer(widget.line6),
          ],
          const SizedBox(width: 5)
        ],
      ),
    );
  }

  Widget _childContainer(Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      width: widget.size.width * 0.1,
      height: widget.size.height,
    );
  }
}
