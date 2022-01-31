import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/local/fake_locations.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/auth/otp_screen.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/auth/choose_region_view.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class ChooseRegionScreen extends StatefulWidget {
  const ChooseRegionScreen({Key? key}) : super(key: key);

  @override
  _ChooseRegionScreenState createState() => _ChooseRegionScreenState();
}

class _ChooseRegionScreenState extends State<ChooseRegionScreen>
    with ManualNavigatorMixin {
  bool visibleSpinner = false;
  int lastIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 38,
                top: screenHeight(context, 0.2),
              ),
              child: const CustomTextView(
                textPaste: 'Hazırda yaşadığınız\nregionu seçin',
                textSize: 25,
                textColor: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  if (visibleSpinner == false) {
                    visibleSpinner = true;
                  } else if (visibleSpinner == true) {
                    visibleSpinner = false;
                  }
                });
              },
              child: Container(
                width: screenWidth(context, 1),
                height: 45,
                margin: EdgeInsets.only(
                  top: screenHeight(context, 0.35),
                  left: 36,
                  right: 36,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(238, 236, 249, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 14,
                      ),
                      child: CustomTextView(
                        textPaste: "Regionu seçin",
                        textSize: 13,
                        textColor: Color.fromRGBO(82, 67, 194, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14, top: 5),
                      child: Transform.rotate(
                        angle: visibleSpinner == true ? 20.5 : 17.3,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                          color: buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            visibleSpinner == true
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: screenWidth(context, 1),
                      height: 135,
                      margin: const EdgeInsets.only(
                        left: 37,
                        right: 37,
                        top: 80,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(238, 236, 249, 1),
                      ),
                      child: ListView.builder(
                        itemCount: fakeLocations.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                lastIndex = index;
                              });
                            },
                            child: regionListItem(
                              context,
                              fakeLocations[index],
                              index,
                              lastIndex,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                ),
                child: CustomButton(
                  callback: () {
                    manualNavigatorTransition(
                      context,
                      const OtpScreen(),
                    );
                  },
                  buttonTextPaste: "Davam et",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
