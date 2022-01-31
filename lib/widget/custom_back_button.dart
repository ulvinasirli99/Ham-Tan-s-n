import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? callback;
  const CustomBackButton({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 25,
        color: Colors.black,
      ),
    );
  }
}
