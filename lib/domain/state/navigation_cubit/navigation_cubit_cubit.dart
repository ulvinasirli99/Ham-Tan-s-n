import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everyone_know_app/utils/enums/navbar_item.dart';

part 'navigation_cubit_state.dart';

class NavigationCubitCubit extends Cubit<NavigationCubitState> {
  NavigationCubitCubit()
      : super(
          const NavigationCubitState(NavbarItem.home),
        );

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationCubitState(NavbarItem.home));
        break;
      case NavbarItem.addSatus:
        emit(const NavigationCubitState(NavbarItem.addSatus));
        break;
      case NavbarItem.message:
        emit(const NavigationCubitState(NavbarItem.message));
        break;
      case NavbarItem.profile:
        emit(const NavigationCubitState(NavbarItem.profile));
        break;
    }
  }
}
