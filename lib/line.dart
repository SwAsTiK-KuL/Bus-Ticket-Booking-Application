import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double width;
  final Color color;

  const Line({
    Key? key,
    required this.width,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: width,
      color: color,
    );
  }
}
