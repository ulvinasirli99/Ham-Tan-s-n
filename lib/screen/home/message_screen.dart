import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/cubit/navigation_cubit_cubit.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/utils/enums/navbar_item.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/widget/message/message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with ManualNavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 244, 250, 1),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarComponent(
              appBarText: "Söhbətlər",
              callback: () {
                BlocProvider.of<NavigationCubitCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight(context, 0.05),),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 14,left: 10,right: 10),
                      child: GestureDetector(
                        onTap: () {
                          manualNavigatorTransition(
                            context,
                            const ChatScreen(),
                          );
                        },
                        child: MessageItem(
                          imageOrNameText: index > 0 ? "al" : "1",
                          msgNotif: index == 1
                              ? "Sabah dırnaq üçün yazılmaq istəyirəm, alınır?"
                              : "Məsmə sabah gəlim paltarın ölcüsünü primerka edək",
                          msgName: "Anaxanım${index + 1}",
                          msgNoVisibleColor:
                              index == 0 ? textColorGrey : textColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
