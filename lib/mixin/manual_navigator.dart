import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin ManualNavigatorMixin {
  /*
  Todo Manual NavigatorMixin with All Screen Page Transition...
  */
  void manualNavigatorTransition(BuildContext context, Widget pushWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => pushWidget,
      ),
    );
  }
}
