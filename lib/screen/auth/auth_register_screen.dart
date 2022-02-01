import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/home/navigation_screen.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/auth/register_form_view.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';

class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({Key? key}) : super(key: key);

  @override
  _AuthRegisterScreenState createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen>
    with ManualNavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveWidget(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(
              top: screenHeight(context, 0.2),
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(247, 247, 247, 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.5),
                topLeft: Radius.circular(16.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    top: 34,
                  ),
                  child: CustomTextView(
                    textPaste: "Qeydiyyat",
                    textSize: 25,
                    fontWeight: FontWeight.w600,
                    textColor: textColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    top: 25,
                  ),
                  child: CustomTextView(
                    textPaste: "Məlumatlarınızı əlavə edin",
                    textSize: 13,
                    fontWeight: FontWeight.w500,
                    textColor: textColor,
                  ),
                ),
                // todo Name FormFiled
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight(context, 0.03),
                  ),
                  child: const RegisterFormView(
                    formName: "Ad",
                    formHintText: "Adınızı daxil edin",
                  ),
                ),
                // todo Surname Forfield
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight(context, 0.02),
                  ),
                  child: const RegisterFormView(
                    formName: "Soyad",
                    formHintText: "Soyadınızı daxil edin",
                  ),
                ),
                //todo Biznes FormFiled
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight(context, 0.02),
                  ),
                  child: const RegisterFormView(
                    formName: "Biznesiniz",
                    formHintText: "Misal: Dərzi, dırnaq qaynağı, geyim dükanı",
                  ),
                ),
                SizedBox(
                  height: screenHeight(context, 0.07),
                ),
                CustomButton(
                  buttonTextPaste: "Başla",
                  callback: () {
                    manualNavigatorTransition(
                      context,
                      const NavigationScreen(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
