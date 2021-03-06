import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/auth/otp_verfication.dart';
import 'package:everyone_know_app/utils/formatter/formatters.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/utils/validator/validations.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with ManualNavigatorMixin {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackground,
      body: SafeArea(
        child: Form(
          key: formGlobalKey,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraint.maxHeight,
                  ),
                  child: IntrinsicHeight(
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
                            textPaste: 'OTP T??sdiql??nm??',
                            textSize: 25,
                            textColor: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 23, top: 60),
                          child: CustomTextView(
                            textPaste:
                                'Qeyd etdiyiniz mobil n??mr??y?? q??sa m??dd??td??\nbird??f??lik kod g??nd??ril??c??k.',
                            textSize: 13,
                            textColor: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23, right: 90),
                          child: Row(
                            children: [
                              const CustomTextView(
                                textPaste: '+994',
                                textSize: 25,
                                textColor: textColor,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: otpController,
                                  inputFormatters: [
                                    maskFormatter,
                                  ],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: textColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "(00) 000-00-00",
                                    errorStyle: TextStyle(height: 0),
                                    border: InputBorder.none,
                                    counterStyle: TextStyle(
                                      fontSize: 25,
                                      color: textColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 25,
                                      color: textColorGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
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
                            buttonTextPaste: "G??nd??r",
                            callback: () {
                              if (otpController.text.length < 9) {
                                Fluttertoast.showToast(
                                  gravity: ToastGravity.TOP,
                                  msg: "Z??hm??t olmasa n??mr??nizi daxil edin",
                                );
                              } else {
                                manualNavigatorTransition(
                                  context,
                                  const OtpVerficationScreen(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
