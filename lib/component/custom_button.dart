import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonTextPaste;
  final VoidCallback? callback;
  const CustomButton({
    Key? key,
    this.callback,
    this.buttonTextPaste,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: screenWidth(context, 1),
        height: 55,
        margin: const EdgeInsets.only(
          left: 38,
          right: 38,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Center(
          child: CustomTextView(
            textPaste: buttonTextPaste ?? "Başla",
            textSize: 15,
            textColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
