import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everyone_know_app/domain/model/profile_data.dart';
import 'package:everyone_know_app/domain/repository/usecr_all_data.repo.dart';
import 'package:logger/logger.dart';

part 'user_profil_data_cubit_state.dart';

class UserProfilDataCubit extends Cubit<UserProfilDataCubitState> {
  UserProfilDataCubit(this.dataRepository)
      : super(UserProfilDataCubitInitial());
  final UserAllDataRepository dataRepository;

  UserAllDataModel model = UserAllDataModel();

  void userProfilAllData() async {
    try {
      emit(UserProfilDataCubitLoading());
      model = (await dataRepository.userAllDataRepository())!;
      Logger().i("User All Data Cubit Initial : " + model.toString());
      emit(UserProfilDataCubitLoaded(model));
    } catch (e) {
      emit(UserProfilDataCubitError(e.toString()));
    }
  }
}
