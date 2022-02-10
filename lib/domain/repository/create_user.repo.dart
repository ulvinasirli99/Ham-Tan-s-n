import 'dart:io';

import 'package:everyone_know_app/domain/model/status.dart';
import 'package:everyone_know_app/domain/service/create_status.service.dart';

class CreateUserRepository {
  Future<UserCreateStatus?> createUserStatusRepository(String id, String text,
      {File? imgUrl}) async {
    CreateStatusService createStatusService = CreateStatusService();
    return await createStatusService.createStatusForUserint(
      id,
      text,
      imgUrl: imgUrl,
    );
  }
}
