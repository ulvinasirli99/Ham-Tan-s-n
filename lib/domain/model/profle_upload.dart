import 'dart:convert';

ProfileUploadModel profileUploadFromJson(String str) =>
    ProfileUploadModel.fromJson(json.decode(str));

String profileUploadToJson(ProfileUploadModel data) =>
    json.encode(data.toJson());

class ProfileUploadModel {
  ProfileUploadModel({
    this.name,
    this.surname,
    this.about,
    this.marriage,
    this.numberHide,
    this.business,
    this.image,
  });

  String? name;
  String? surname;
  String? about;
  String? marriage;
  String? image;
  bool? numberHide;
  int? business;

  factory ProfileUploadModel.fromJson(Map<String, dynamic> json) =>
      ProfileUploadModel(
        name: json["name"],
        surname: json["surname"],
        about: json["about"],
        marriage: json["marriage"],
        numberHide: json["number_hide"],
        business: json["business"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "about": about,
        "marriage": marriage,
        "number_hide": numberHide,
        "business": business,
        "image": image,
      };
}
