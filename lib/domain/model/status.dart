import 'dart:convert';

UserCreateStatus userCreateStatusFromJson(String str) =>
    UserCreateStatus.fromJson(json.decode(str));

String userCreateStatusToJson(UserCreateStatus data) =>
    json.encode(data.toJson());

class UserCreateStatus {
  UserCreateStatus({
    this.id,
    this.image,
    this.text,
    this.user,
  });

  int? id;
  String? image;
  String? text;
  int? user;

  factory UserCreateStatus.fromJson(Map<String, dynamic> json) =>
      UserCreateStatus(
        id: json["id"],
        image: json["image"],
        text: json["text"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "text": text,
        "user": user,
      };
}
