import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class MySendMsgView extends StatelessWidget {
  final String? imageUrl;
  final String? msgTextValue;
  final bool? statusTextViewer;
  const MySendMsgView({
    Key? key,
    this.imageUrl,
    this.msgTextValue,
    this.statusTextViewer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: imageUrl == null ? 90 : 250,
      margin: const EdgeInsets.only(
        left: 22,
        right: 26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: buttonColor,
                ),
                child: const Center(
                  child: CustomTextView(
                    textPaste: "A",
                    textSize: 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const CustomTextView(
                textPaste: "Anaxanım",
                textSize: 14,
                textColor: Color.fromRGBO(18, 14, 33, 1),
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                width: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3),
                child: CustomTextView(
                  textPaste: "21/11/2021",
                  textSize: 11,
                  textColor: textColorGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // todo If the image is not null, then get an image
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                statusTextViewer == true
                    ? const SizedBox()
                    : Container(
                        width: 2,
                        height: 150,
                        color: Colors.grey.shade300,
                      ),
                imageUrl == null
                    ? const SizedBox()
                    : Container(
                        width: 100,
                        height: 150,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                imageUrl ??
                                    "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            statusTextViewer == false
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 9, left: 8),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CustomTextView(
                                        textPaste:
                                            """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas consequat varius molestie. In in egestas diam. Aliquam non neque a elit malesuada blandit""",
                                        textSize: 6,
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          msgTextValue == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: CustomTextView(
                    textPaste: msgTextValue ??
                        "Məsmə salam, 10 günə toya paltarı çatdıra biləcəksən?",
                    textSize: 14,
                    textColor: textColorGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ],
      ),
    );
  }
}
