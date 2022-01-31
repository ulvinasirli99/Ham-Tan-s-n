import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/settings/personal_information.screen.dart';
import 'package:everyone_know_app/screen/settings/security_screen.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with ManualNavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarComponent(
              appBarText: "Tənzimləmələr",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight(context, 0.06),
                left: screenWidth(context, 0.04),
                right: screenWidth(context, 0.03),
              ),
              child: ListTile(
                onTap: () {
                  manualNavigatorTransition(
                    context,
                    const PersonalInformationScreen(),
                  );
                },
                title: const CustomTextView(
                  textPaste: "Şəxsi məlumatlar",
                  textSize: 16,
                  textColor: textColor,
                  fontWeight: FontWeight.w500,
                ),
                subtitle: const CustomTextView(
                  textPaste: "Məlumatları yeniləmək",
                  textSize: 14,
                  textColor: textColorGrey,
                  fontWeight: FontWeight.w400,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color.fromRGBO(182, 186, 200, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight(context, 0.03),
                left: screenWidth(context, 0.04),
                right: screenWidth(context, 0.03),
              ),
              child: ListTile(
                onTap: () {
                  manualNavigatorTransition(
                    context,
                    const SecurityScreen(),
                  );
                },
                title: const CustomTextView(
                  textPaste: "Təhlükəsizlik",
                  textSize: 16,
                  textColor: textColor,
                  fontWeight: FontWeight.w500,
                ),
                subtitle: const CustomTextView(
                  textPaste: "Şifrə təyin etmək",
                  textSize: 14,
                  textColor: textColorGrey,
                  fontWeight: FontWeight.w400,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color.fromRGBO(182, 186, 200, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight(context, 0.03),
                left: screenWidth(context, 0.04),
                right: screenWidth(context, 0.03),
              ),
              child: ListTile(
                onTap: () {},
                title: const CustomTextView(
                  textPaste: "Sistemdən çıxış",
                  textSize: 16,
                  textColor: textColor,
                  fontWeight: FontWeight.w500,
                ),
                subtitle: const CustomTextView(
                  textPaste: "Hesabınızdan çıxış üçün klikləyin",
                  textSize: 14,
                  textColor: textColorGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
