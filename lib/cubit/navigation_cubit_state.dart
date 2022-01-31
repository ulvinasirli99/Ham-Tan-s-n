part of 'navigation_cubit_cubit.dart';

class NavigationCubitState extends Equatable {
  final NavbarItem navbarItem;

  const NavigationCubitState(this.navbarItem,);

  @override
  List<Object> get props => [navbarItem,];
}
