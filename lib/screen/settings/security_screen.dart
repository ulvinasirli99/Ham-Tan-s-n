import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/auth/register_form_view.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool numberVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarComponent(
              appBarText: "Təhlükəsizlik",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight(context, 0.04),
                left: 22,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextView(
                    textPaste: "Nömrəmi gizlət",
                    textSize: 16,
                    textColor: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Switch(
                    value: numberVisible,
                    activeColor: securitySwitchIconColor,
                    onChanged: (value) {
                      setState(() {
                        numberVisible = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23),
              child: CustomTextView(
                textPaste:
                    "Qeydiyyat zamanı istifadə etdiyiniz nömrənizin digər\nistifadəçilər tərəfindən görünməsini burdan tənzimləyə\nbilərsiniz.",
                textSize: 11,
                textColor: textColorGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 22),
              child: RegisterFormView(
                formName: "Mobil nömrəniz",
                maskFormatterCheck: true,
                editableEditText: false,
                textInputType: TextInputType.number,
                formHintText: "+994 (55) 555-55-55",
                hintFontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 23,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    color: infoIconColor,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomTextView(
                    textPaste:
                        "Mobil nömrə təhlükəsizlik baxımından dəyişdirilmir.",
                    textSize: 11,
                    textColor: textColorGrey,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 29),
              child: RegisterFormView(
                formName: "Regionunuz",
                maskFormatterCheck: true,
                editableEditText: false,
                textInputType: TextInputType.number,
                formHintText: "Tərtər",
                hintFontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 23,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    color: infoIconColor,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomTextView(
                    textPaste:
                        "Qeydiyyatda olduğunuz bölgəni dəyişdirə bilmirsiniz",
                    textSize: 11,
                    textColor: textColorGrey,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomButton(
                buttonTextPaste: "Yadda saxla",
                callback: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
