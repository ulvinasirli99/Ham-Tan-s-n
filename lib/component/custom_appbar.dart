import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class CustomAppBarComponent extends StatelessWidget {
  final String? appBarText;
  final VoidCallback? callback;
  const CustomAppBarComponent({
    Key? key,
    required this.appBarText,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: const BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: callback ??
                  () {
                    Navigator.pop(context);
                  },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CustomTextView(
              textPaste: appBarText ?? "Tənzimləmələr",
              textSize: 18,
              textColor: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
