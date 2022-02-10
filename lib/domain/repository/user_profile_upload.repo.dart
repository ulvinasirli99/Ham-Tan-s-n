import 'dart:io';

import 'package:everyone_know_app/domain/model/profle_upload.dart';
import 'package:everyone_know_app/domain/service/user_profile_upload.service.dart';

class UserProfileUploadRepository {
  Future<ProfileUploadModel?> uploadProfileImgRepo({
    File? userProfileImgUrl,
  }) async {
    UserProfileUploadService uploadService = UserProfileUploadService();
    return await uploadService.profileUploadService(
      imageFile: userProfileImgUrl,
    );
  }
}
