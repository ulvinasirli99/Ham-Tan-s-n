import 'package:everyone_know_app/component/message_send_button.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/story/custom_story_view.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_viewer/story_viewer.dart';

class StatusViewScreen extends StatefulWidget {
  final bool? checkUserStory;
  const StatusViewScreen({
    Key? key,
    this.checkUserStory = false,
  }) : super(key: key);

  @override
  _StatusViewScreenState createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen> {
  late List<StoryItemModel> storyItems = [];
  late StoryViewerController controller = StoryViewerController();
  @override
  void initState() {
    super.initState();
    storyItems = const [
      StoryItemModel(
        imageProvider: NetworkImage(
          "https://www.publicdomainpictures.net/pictures/420000/velka/queen-princess-redhead-cosplay-1631168365cxQ.jpg",
        ),
      ),
      StoryItemModel(
        imageProvider: NetworkImage(
          "https://www.publicdomainpictures.net/pictures/420000/velka/queen-princess-redhead-cosplay-1631168365cxQ.jpg",
        ),
      ),
      StoryItemModel(
        imageProvider: NetworkImage(
          "https://www.publicdomainpictures.net/pictures/420000/velka/queen-princess-redhead-cosplay-1631168365cxQ.jpg",
        ),
      ),
    ];
    controller.addListener(
      onComplated: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                top: screenHeight(context, 0.04),
                bottom: widget.checkUserStory == false
                    ? screenHeight(context, 0.3)
                    : screenHeight(context, 0.28),
              ),
              child: CustomStoryView(
                userName: "Natavan",
                storyItems: storyItems,
                controller: controller,
                imageUrl:
                    "https://i.pinimg.com/564x/8b/30/de/8b30dead52fb583f2561eee302f6a672.jpg",
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: widget.checkUserStory == true
                      ? screenHeight(context, 0.12)
                      : screenHeight(context, 0.15),
                  left: 37,
                  right: 37,
                ),
                child: const CustomTextView(
                  textPaste:
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec dolor tempus, sollicitudin enim et, maximus massa.""",
                  textSize: 16,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            widget.checkUserStory == false
                ? const SizedBox()
                : Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, right: 10),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            controller.infoPause();
                          });
                          showCupertinoDialog(
                            context: context,
                            builder: (ctx) {
                              return Center(
                                child: alertDialog(context),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
            widget.checkUserStory == false
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MessageSendButton(
                        sendMessage: () {},
                        hideImageIcon: true,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Container alertDialog(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165,
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 12,
          left: 14,
          right: 11,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTextView(
              textPaste: "Delete Confirmation",
              textColor: Colors.black,
              textDecoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
              textSize: 18,
            ),
            const CustomTextView(
              textPaste: "Are you sure you want to delete this\nitem?",
              textColor: Colors.black,
              textDecoration: TextDecoration.none,
              fontWeight: FontWeight.w500,
              textSize: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.infoPlay();
                      Navigator.pop(context);
                    });
                  },
                  child: const CustomTextView(
                    textPaste: "Delete",
                    textDecoration: TextDecoration.none,
                    textColor: Color.fromRGBO(48, 156, 244, 1),
                    fontWeight: FontWeight.w400,
                    textSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.infoPlay();
                      Navigator.pop(context);
                    });
                  },
                  child: const CustomTextView(
                    textPaste: "Cancel",
                    textDecoration: TextDecoration.none,
                    textColor: Color.fromRGBO(48, 156, 244, 1),
                    fontWeight: FontWeight.w400,
                    textSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
