import 'package:everyone_know_app/color/app_color.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final bool changeIconColor;
  final VoidCallback? callback;
  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.changeIconColor,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: Icon(
        iconData,
        size: 30,
        color: changeIconColor == false ? navigationIconColor : buttonColor,
      ),
    );
  }
}
