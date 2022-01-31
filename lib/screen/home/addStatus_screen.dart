import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';

class AddStatusScreen extends StatefulWidget {
  const AddStatusScreen({Key? key}) : super(key: key);

  @override
  _AddStatusScreenState createState() => _AddStatusScreenState();
}

class _AddStatusScreenState extends State<AddStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarComponent(appBarText: "Əlavə et"),
              SizedBox(
                height: screenHeight(context, 0.05),
              ),
              Center(
                child: Container(
                  width: 120,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGFkeXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 21,
                  top: screenHeight(context, 0.07),
                ),
                child: const CustomTextView(
                  textPaste: "Təsvir",
                  textSize: 16,
                  textColor: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: screenHeight(context, 0.2),
                margin: const EdgeInsets.only(
                  left: 21,
                  right: 21,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(218, 225, 243, 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 11,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      hintText: "Qeydi bura əlavə edin",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColorGrey,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 11),
                child: CustomButton(
                  buttonTextPaste: "Yekunlaşdır",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
