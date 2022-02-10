import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everyone_know_app/domain/model/profle_upload.dart';
import 'package:everyone_know_app/domain/repository/user_profile_upload.repo.dart';
import 'package:logger/logger.dart';

part 'user_profile_upload_state.dart';

class UserProfileUploadCubit extends Cubit<UserProfileUploadState> {
  UserProfileUploadCubit(this.repository) : super(UserProfileUploadInitial());

  final UserProfileUploadRepository repository;

  ProfileUploadModel uploadModel = ProfileUploadModel();

  void userProfileUploadCubit({File? userProfileImgUrl}) async {
    try {
      emit(UserProfileUploadLoading());
      uploadModel = (await repository.uploadProfileImgRepo(
        userProfileImgUrl: userProfileImgUrl,
      ))!;
      emit(UserProfileUploadLoaded(uploadModel));
      Logger().log(
          Level.verbose, "Upload Model Initalized : " + uploadModel.toString());
    } catch (e) {
      emit(
        UserProfileUploadError(
          e.toString(),
        ),
      );
    }
  }
}
