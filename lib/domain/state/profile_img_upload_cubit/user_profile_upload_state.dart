part of 'user_profile_upload_cubit.dart';

abstract class UserProfileUploadState extends Equatable {
  const UserProfileUploadState();

  @override
  List<Object> get props => [];
}

class UserProfileUploadInitial extends UserProfileUploadState {}

class UserProfileUploadLoading extends UserProfileUploadState {}

class UserProfileUploadLoaded extends UserProfileUploadState {
  final ProfileUploadModel uploadModel;

  const UserProfileUploadLoaded(this.uploadModel);
}

class UserProfileUploadError extends UserProfileUploadState {
  final String error;

  const UserProfileUploadError(this.error);
}
