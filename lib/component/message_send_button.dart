import 'package:everyone_know_app/color/app_color.dart';
import 'package:flutter/material.dart';

class MessageSendButton extends StatelessWidget {
  final VoidCallback? sendMessage, imageSelect;
  final bool? hideImageIcon;
  const MessageSendButton({
    Key? key,
    this.sendMessage,
    this.imageSelect,
    this.hideImageIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        height: 58,
        margin: const EdgeInsets.only(left: 26, right: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: Colors.white,
          border: Border.all(
            width: 1.2,
            color: const Color.fromRGBO(41, 41, 44, 0.12),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "İsmarıcınızı daxil edin...",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: textColorGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  hideImageIcon == true
                      ? const SizedBox()
                      : IconButton(
                          onPressed: imageSelect,
                          icon: const Icon(
                            Icons.photo_outlined,
                            size: 22,
                            color: textColorGrey,
                          ),
                        ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: sendMessage,
                    child: Container(
                      width: 48,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: sendMessageButtonColor,
                      ),
                      child: Center(
                        child: Transform.rotate(
                          angle: 20.4,
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
