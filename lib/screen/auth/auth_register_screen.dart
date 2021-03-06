import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/constants/constants.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/home/navigation_screen.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/auth/register_form_view.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({Key? key}) : super(key: key);

  @override
  _AuthRegisterScreenState createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen>
    with ManualNavigatorMixin {
  String? chosenValue;
  TextEditingController nameCtr = TextEditingController();
  TextEditingController surNameCtr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool choseTypeCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
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
                      textPaste: "M??lumatlar??n??z?? ??lav?? edin",
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
                    child: RegisterFormView(
                      formName: "Ad",
                      controller: nameCtr,
                      formHintText: "Ad??n??z?? daxil edin",
                    ),
                  ),
                  // todo Surname Forfield
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight(context, 0.02),
                    ),
                    child: RegisterFormView(
                      formName: "Soyad",
                      controller: surNameCtr,
                      formHintText: "Soyad??n??z?? daxil edin",
                    ),
                  ),
                  //todo Biznes FormFiled
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight(context, 0.03),
                    ),
                    child: RegisterFormView(
                      formName: "Biznesiniz",
                      hintFontSize: 15,
                      formFieldBackColor: Colors.white,
                      childWidget: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: DropdownButton<String>(
                          value: chosenValue,
                          underline: const SizedBox(),
                          style: const TextStyle(color: Colors.black),
                          items: sampleBiznesModels
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomTextView(
                                textPaste: value,
                              ),
                            );
                          }).toList(),
                          hint: const CustomTextView(
                            textPaste: "Z??hm??t olmasa se??in",
                            textSize: 13,
                            fontWeight: FontWeight.w500,
                            textColor: textColorGrey,
                          ),
                          onChanged: (value) {
                            setState(() {
                              chosenValue = value;
                              choseTypeCheck = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context, 0.07),
                  ),
                  CustomButton(
                    buttonTextPaste: "Ba??la",
                    callback: () {
                      if (nameCtr.text.length < 4 ||
                          surNameCtr.text.length < 4 ||
                          choseTypeCheck == false) {
                        Fluttertoast.showToast(
                            msg: "Z??hm??t olmasa b??t??n xanalar?? doldurun");
                      } else {
                        manualNavigatorTransition(
                          context,
                          const NavigationScreen(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
