import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/cubit/navigation_cubit_cubit.dart';
import 'package:everyone_know_app/screen/profile/profile_screen.dart';
import 'package:everyone_know_app/screen/home/addStatus_screen.dart';
import 'package:everyone_know_app/screen/home/home_screen.dart';
import 'package:everyone_know_app/screen/home/message_screen.dart';
import 'package:everyone_know_app/utils/enums/navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BlocBuilder<NavigationCubitCubit, NavigationCubitState>(
        builder: (context, state) {
          return BottomNavigationBar(
            showUnselectedLabels: false,
            elevation: 0.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0 ? buttonColor : textColorGrey,
                  size: 30,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 30,
                  color: currentIndex == 1 ? buttonColor : textColorGrey,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message_outlined,
                  size: 30,
                  color: currentIndex == 2 ? buttonColor : textColorGrey,
                ),
                label: "",
              ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
              if (index == 0) {
                BlocProvider.of<NavigationCubitCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubitCubit>(context)
                    .getNavBarItem(NavbarItem.addSatus);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubitCubit>(context)
                    .getNavBarItem(NavbarItem.message);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubitCubit, NavigationCubitState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomeScreen();
          } else if (state.navbarItem == NavbarItem.addSatus) {
            return const AddStatusScreen();
          } else if (state.navbarItem == NavbarItem.message) {
            return const MessageScreen();
          } else if (state.navbarItem == NavbarItem.profile) {
            return const ProfileScreen();
          }
          return Container();
        },
      ),
    );
  }
}
