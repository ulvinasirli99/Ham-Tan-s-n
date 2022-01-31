import 'package:flutter/material.dart';
import 'package:story_viewer/models/story_item.dart';
import 'package:story_viewer/models/user.dart';
import 'package:story_viewer/viewer.dart';
import 'package:story_viewer/viewer_controller.dart';

class CustomStoryView extends StatelessWidget {
  final List<StoryItemModel>? storyItems;
  final String? imageUrl;
  final String? userName;
  final StoryViewerController controller;

  const CustomStoryView({
    Key? key,
    required this.storyItems,
    this.imageUrl,
    this.userName,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoryViewer(
      viewerController: controller,
      progressBorderRadius: BorderRadius.circular(60),
      backgroundColor: Colors.black,
      titleStyle: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      progressRowPadding: const EdgeInsets.only(
        left: 11,
        right: 11,
      ),
      ratio: StoryRatio.r16_9,
      stories: storyItems,
      userModel: UserModel(
        username: userName ?? "Natavan",
        profilePicture: NetworkImage(
          imageUrl ??
              "https://i.pinimg.com/564x/8b/30/de/8b30dead52fb583f2561eee302f6a672.jpg",
        ),
      ),
    );
  }
}
