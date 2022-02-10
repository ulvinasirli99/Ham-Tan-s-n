import 'package:everyone_know_app/domain/model/profile_data.dart';
import 'package:everyone_know_app/domain/service/user_profile_upload.service.dart';

class UserAllDataRepository {
  Future<UserAllDataModel?> userAllDataRepository() async {
    UserProfileUploadService uploadService = UserProfileUploadService();
    return await uploadService.userProfileData();
  }
}
