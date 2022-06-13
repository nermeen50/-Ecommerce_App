import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final AlignmentGeometry alignment;
  final double? lineSpace;
  final TextOverflow? textOverflow;
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight,
      this.color = Colors.black,
      this.alignment = AlignmentDirectional.topStart,
      this.lineSpace,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          height: lineSpace,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
        // maxLines: 1,
        overflow: textOverflow,
      ),
    );
  }
}
