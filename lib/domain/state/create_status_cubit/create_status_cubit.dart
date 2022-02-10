import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everyone_know_app/domain/model/status.dart';
import 'package:everyone_know_app/domain/repository/create_user.repo.dart';
import 'package:logger/logger.dart';

part 'create_status_state.dart';

class CreateStatusCubit extends Cubit<CreateStatusState> {
  CreateStatusCubit(this.repository) : super(CreateStatusInitial());
  final CreateUserRepository repository;

  UserCreateStatus statusModel = UserCreateStatus();

  void createStatusCubit(String id, String text, {File? image}) async {
    try {
      emit(CreateStatusLoading());
      statusModel = (await repository.createUserStatusRepository(id, text,
          imgUrl: image))!;
      Logger().i("Status Cubit Initazlized : " + statusModel.user.toString());
      emit(CreateStatusLoaded(statusModel));
    } catch (e) {
      Logger().e("Status Cubit Error : "+e.toString());
      emit(CreateStatusError(e.toString()));
    }
  }
}
