import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String? imageOrNameText;
  final String? msgName;
  final String? msgNotif;

  const MessageItem({
    Key? key,
    this.imageOrNameText = "A",
    this.msgName,
    this.msgNotif,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: const EdgeInsets.only(right: 17, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: buttonColor,
                  ),
                  child: imageOrNameText!.length == 1
                      ? const Center(
                          child: CustomTextView(
                            textPaste: "A",
                            textSize: 22,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.only(top: 7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextView(
                          textPaste: msgName ?? "Anaxanım",
                          textSize: 16,
                          textColor: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: double.infinity,
                            height: double.infinity,
                            child: CustomTextView(
                              textPaste: msgNotif ?? "Şəkil göndərdi",
                              textSize: 13,
                              textColor: textColorGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 45),
            child: CustomTextView(
              textPaste: "21/11/2021",
              textSize: 11,
              textColor: textColorGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}