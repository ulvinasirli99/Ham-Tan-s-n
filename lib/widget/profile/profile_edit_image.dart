import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class ProfileEditImage extends StatelessWidget {
  const ProfileEditImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: profileEditImageColor,
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: CustomTextView(
              textPaste: "M",
              textSize: 30,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: buttonColor.withOpacity(0.3),
              child: Image.asset(
                "assets/ellipse_icon.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 6,
              ),
              child: CustomTextView(
                textPaste: "edit",
                textSize: 10,
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
