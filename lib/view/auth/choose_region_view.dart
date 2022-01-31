import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

Padding regionListItem(
  BuildContext context,
  String regionName,
  int checkIndex,
  int lastIndex,
) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 12,
      left: 5,
      right: 5,
    ),
    child: Container(
      width: screenWidth(context, 1),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: checkIndex == lastIndex ? buttonColor : backGreyColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomTextView(
              textPaste: regionName,
              textSize: 13,
              fontWeight: FontWeight.w500,
              textColor: checkIndex == lastIndex ? Colors.white : buttonColor,
            ),
          ),
        ],
      ),
    ),
  );
}
