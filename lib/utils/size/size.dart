import 'package:flutter/cupertino.dart';

// All Screen Size Width Pixel....
double screenWidth(BuildContext context, double pixel) {
  Size size = MediaQuery.of(context).size;
  return size.width * pixel;
}

// All Screen Size Height Pixel....
double screenHeight(BuildContext context, double pixel) {
  Size size = MediaQuery.of(context).size;
  return size.height * pixel;
}
