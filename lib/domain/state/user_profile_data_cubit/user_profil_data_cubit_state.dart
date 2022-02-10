part of 'user_profil_data_cubit_cubit.dart';

abstract class UserProfilDataCubitState extends Equatable {
  const UserProfilDataCubitState();

  @override
  List<Object> get props => [];
}

class UserProfilDataCubitInitial extends UserProfilDataCubitState {}

class UserProfilDataCubitLoading extends UserProfilDataCubitState {}

class UserProfilDataCubitLoaded extends UserProfilDataCubitState {
  final UserAllDataModel dataModel;

  const UserProfilDataCubitLoaded(this.dataModel);
}

class UserProfilDataCubitError extends UserProfilDataCubitState {
  final String error;

  const UserProfilDataCubitError(this.error);
}
