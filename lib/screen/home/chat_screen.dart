import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/component/message_send_button.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/chat/my_send_msg_view.dart';
import 'package:everyone_know_app/view/chat/sender_msg_itemView.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarComponent(appBarText: "Anaxanım"),
            SizedBox(
              height: screenHeight(context, 0.04),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                child: ResponsiveWidget(
                  child: Column(
                    children: const [
                      SenderMsgItem(
                        msgTextValue: "Onda bu gun gedin baxariq",
                      ),
                      MySendMsgView(
                        imageUrl:
                            "https://i.pinimg.com/originals/90/18/3d/90183d7768dd3509c834b878f322aa24.jpg",
                        msgTextValue: "Salam necesen? Gedirik bu gun?",
                      ),
                      SenderMsgItem(
                        msgTextValue: "Onda bu gun gedin baxariq",
                        imageUrl:
                            "https://i.pinimg.com/originals/90/18/3d/90183d7768dd3509c834b878f322aa24.jpg",
                      ),
                      MySendMsgView(
                        imageUrl:
                            "https://i.pinimg.com/originals/90/18/3d/90183d7768dd3509c834b878f322aa24.jpg",
                        msgTextValue: "Salam necesen? Gedirik bu gun?",
                      ),
                      SenderMsgItem(
                        msgTextValue: "Onda bu gun gedin baxariq",
                      ),
                      MySendMsgView(
                        imageUrl:
                            "https://i.pinimg.com/originals/90/18/3d/90183d7768dd3509c834b878f322aa24.jpg",
                        msgTextValue: "Salam necesen? Gedirik bu gun?",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MessageSendButton(
              imageSelect: () {},
              sendMessage: () {},
            ),
          ],
        ),
      ),
    );
  }
}
