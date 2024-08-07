import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fintSize;
  final FontWeight fontWeight;
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fintSize = 20,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fintSize,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
    );
  }
}
