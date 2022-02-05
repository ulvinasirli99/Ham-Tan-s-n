import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/auth/auth_register_screen.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/custom_back_button.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OtpVerficationScreen extends StatefulWidget {
  const OtpVerficationScreen({Key? key}) : super(key: key);

  @override
  _OtpVerficationScreenState createState() => _OtpVerficationScreenState();
}

class _OtpVerficationScreenState extends State<OtpVerficationScreen>
    with ManualNavigatorMixin {
  final defaultDuration = const Duration(minutes: 2, seconds: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackground,
      body: SafeArea(
        child: ResponsiveWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 40),
                child: CustomBackButton(
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23, top: 80),
                child: CustomTextView(
                  textPaste: 'OTP Təsdiqlənmə',
                  textSize: 25,
                  textColor: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23, top: 60),
                child: CustomTextView(
                  textPaste: 'Göndərilən OTP kodu daxil edin.',
                  textSize: 13,
                  textColor: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  top: 15,
                ),
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  cursorColor: const Color.fromRGBO(82, 67, 194, 1),
                  pinTheme: PinTheme(
                    inactiveColor: const Color.fromRGBO(82, 67, 194, 1),
                    activeColor: const Color.fromRGBO(82, 67, 194, 1),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextView(
                      textPaste: "Validity period: ",
                      textSize: 13,
                      textColor: textColorGrey,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SlideCountdown(
                      duration: defaultDuration,
                      decoration: const BoxDecoration(
                        color: screenBackground,
                      ),
                      textStyle: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          color: textColorGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: screenHeight(context, 0.12),
                ),
                child: CustomButton(
                  buttonTextPaste: "Göndər",
                  callback: () {
                    manualNavigatorTransition(
                      context,
                      const AuthRegisterScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
