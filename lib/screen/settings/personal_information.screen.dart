import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/constants/constants.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/auth/register_form_view.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveWidget(
          child: Column(
            children: [
              const CustomAppBarComponent(
                appBarText: "Şəxsi məlumatlar",
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight(context, 0.04),
                ),
                child: const RegisterFormView(
                  formName: "Ad",
                  hintFontSize: 15,
                  formHintText: "Məsməxanım",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight(context, 0.03),
                ),
                child: const RegisterFormView(
                  formName: "Soyad",
                  hintFontSize: 15,
                  formHintText: "Xoşduyeva",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight(context, 0.03),
                ),
                child: RegisterFormView(
                  childWidget: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      underline: const SizedBox(),
                      style: const TextStyle(color: Colors.black),
                      items: maritalStatus
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text(
                        "Please choose a langauage",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight(context, 0.03),
                ),
                child: const RegisterFormView(
                  formName: "Biznesiniz",
                  hintFontSize: 15,
                  formHintText: "Dərzi",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight(context, 0.03),
                ),
                child: const RegisterFormView(
                  formName: "Haqqınızda",
                  hintFontSize: 15,
                  formHintText: "Qısa məlumat",
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CustomButton(
                  buttonTextPaste: "Yadda saxla",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
