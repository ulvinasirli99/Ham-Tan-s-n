import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:everyone_know_app/domain/model/profile_data.dart';
import 'package:everyone_know_app/domain/model/profle_upload.dart';
import 'package:everyone_know_app/utils/endpoints/api_endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UserProfileUploadService {
  // Todo Profile Upload Img
  Future<ProfileUploadModel?> profileUploadService({File? imageFile}) async {
    // ignore: deprecated_member_use
    var stream = http.ByteStream(DelegatingStream.typed(imageFile!.openRead()));

    var length = await imageFile.length();

    var uri = Uri.parse(userProfileImageUploadUrl);

    var request = http.MultipartRequest("PUT", uri);

    Map<String, String> headers = {};

    headers = {
      "Authorization": "Token 8658f8a99120274f79e6e0390276046d44303beb",
      "Content-type": "multipart/form-data",
      "X-CSRFToken":
          "QQ80uhVlBRPjjNi9PGxdADoljTafbkc7t4ORKM3pQ1iJDXrXqkXcGDtzAZSoXnpt",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    request.headers.addAll(headers);

    var multipartFile = http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();
    debugPrint(response.statusCode.toString());
    response.stream.transform(utf8.decoder).listen((value) {
      debugPrint(value);
    });
  }

  // Todo Profile Data
  Future<UserAllDataModel?> userProfileData() async {
    var response = await http.get(
      Uri.parse(userProfileAllData),
      headers: {
        "Authorization": "Token 8658f8a99120274f79e6e0390276046d44303beb",
        "X-CSRFToken":
            "QQ80uhVlBRPjjNi9PGxdADoljTafbkc7t4ORKM3pQ1iJDXrXqkXcGDtzAZSoXnpt",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      debugPrint(
          "UserAllDataModel Status Code : " + response.statusCode.toString());
      return UserAllDataModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint("UserAllDataModel Status Error Code : " +
          response.statusCode.toString());
    }
  }
}


/*


  Map<String, String> hasMap =  {};
    hasMap = {
      "name": "Ulvi",
      "surname": "Nesirov",
      "about": "Menim",
      "marriage": "S",
    };
    final response = await http.put(
      Uri.parse(userProfileImageUploadUrl),
      headers: {
        "Authorization": "Token 8658f8a99120274f79e6e0390276046d44303beb",
        "Content-type": "multipart/form-data",
        "X-CSRFToken":
            "QQ80uhVlBRPjjNi9PGxdADoljTafbkc7t4ORKM3pQ1iJDXrXqkXcGDtzAZSoXnpt",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(hasMap),
    );
    if (response.statusCode == 200) {
      Logger().i(
        "Response Status Code : " + response.statusCode.toString(),
      );
      var data = jsonDecode(response.body);
      Logger().i(
        "Response Data : " + data.toString(),
      );
      return profileUploadFromJson(data);
    } else {
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "Error Found : " + response.statusCode.toString(),
      );
      Logger().v("Error Found : " + response.statusCode.toString());
    }


*/