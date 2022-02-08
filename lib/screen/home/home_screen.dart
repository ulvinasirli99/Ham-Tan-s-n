import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/cubit/navigation_cubit_cubit.dart';
import 'package:everyone_know_app/local/fake_locations.dart';
import 'package:everyone_know_app/mixin/manual_navigator.dart';
import 'package:everyone_know_app/screen/home/status_view.dart';
import 'package:everyone_know_app/utils/enums/navbar_item.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/auth/choose_region_view.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_viewer/models/story_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ManualNavigatorMixin {
  int lastIndex = -1;
  String locationName = "Tərtər";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 12,
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: screenWidth(context, 1),
                                    height: 135,
                                    margin: EdgeInsets.only(
                                      left: 13,
                                      right: screenWidth(context, 0.15),
                                      top: screenHeight(context, 0.12),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromRGBO(
                                          238, 236, 249, 1),
                                    ),
                                    child: ListView.builder(
                                      itemCount: fakeLocations.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (ctx, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              locationName =
                                                  fakeLocations[index];
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
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomTextView(
                          textPaste: locationName,
                          textSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: textColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, left: 2),
                          child: Transform.rotate(
                            angle: 17.2,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: textColor,
                              size: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationCubitCubit>(context)
                          .getNavBarItem(NavbarItem.profile);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(180, 132, 240, 1),
                      ),
                      child: const Center(
                        child: CustomTextView(
                          textPaste: "M",
                          textSize: 16,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 14, top: screenHeight(context, 0.07)),
              child: const CustomTextView(
                textPaste: "Təkliflər",
                textSize: 20,
                textColor: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                ),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.2),
                  ),
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        manualNavigatorTransition(
                          context,
                          const StatusViewScreen(
                            checkUserStory: true,
                            storyItems: [
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
                            ],
                          ),
                        );
                      },
                      child: friendOfferGridItem(),
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

  SizedBox friendOfferGridItem() {
    return SizedBox(
      width: 90,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: buttonColor,
              ),
            ),
            child: Center(
              child: Container(
                width: 82,
                height: 82,
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://www.inpixio.com/remove-background/images/main-before.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextView(
            textPaste: "Natavan",
            textSize: 16,
            textColor: textColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextView(
            textPaste: "Dərzi",
            textSize: 13,
            textAlign: TextAlign.center,
            textColor: textColor,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
