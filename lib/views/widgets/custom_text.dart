import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int? maxLines;
  final double? lineSpace;

  const CustomText({
    Key? key,
    this.text = "",
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.maxLines,
    this.lineSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: lineSpace,
          fontSize: fontSize,
          fontFamily: "SourceSansPro",
        ),
        maxLines: maxLines,
      ),
    );
  }
}
