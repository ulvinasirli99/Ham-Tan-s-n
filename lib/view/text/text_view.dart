import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String? textPaste;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  const CustomTextView({
    Key? key,
    required this.textPaste,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textPaste!,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
