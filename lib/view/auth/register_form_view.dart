import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/utils/formatter/formatters.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class RegisterFormView extends StatelessWidget {
  final String? formName;
  final String? formHintText;
  final double? hintFontSize;
  final Widget? childWidget;
  final bool? maskFormatterCheck;
  final bool? editableEditText;
  final TextInputType? textInputType;
  final Color? formFieldBackColor;
  final TextEditingController? controller;

  const RegisterFormView({
    Key? key,
    this.formName,
    this.formHintText,
    this.hintFontSize,
    this.childWidget,
    this.maskFormatterCheck = false,
    this.textInputType,
    this.editableEditText = true,
    this.formFieldBackColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: const EdgeInsets.only(right: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
            ),
            child: CustomTextView(
              textPaste: formName ?? "Ad",
              textSize: 14,
              textColor: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              top: 5,
            ),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: formFieldBackColor ?? whiteColor,
              ),
              padding: const EdgeInsets.only(left: 14),
              child: childWidget ??
                  TextFormField(
                    keyboardType: textInputType ?? TextInputType.text,
                    enabled: editableEditText,
                    controller: controller,
                    inputFormatters: maskFormatterCheck == true
                        ? [
                            maskFormatter,
                          ]
                        : [],
                    decoration: InputDecoration(
                      hintText: formHintText ?? "Adınızı daxil edin",
                      border: InputBorder.none,
                      // todo Montserrat
                      hintStyle: TextStyle(
                        fontSize: hintFontSize ?? 13,
                        color: textColorGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
