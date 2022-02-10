import 'dart:io';
import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/domain/model/profle_upload.dart';
import 'package:everyone_know_app/domain/service/user_profile_upload.service.dart';
import 'package:everyone_know_app/domain/state/profile_img_upload_cubit/user_profile_upload_cubit.dart';
import 'package:everyone_know_app/domain/state/user_profile_data_cubit/user_profil_data_cubit_cubit.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'fake_profile_photo.dart';

class ProfileEditImage extends StatefulWidget {
  ProfileEditImage({Key? key}) : super(key: key);

  @override
  State<ProfileEditImage> createState() => _ProfileEditImageState();
}

class _ProfileEditImageState extends State<ProfileEditImage> {
  final ImagePicker imagePicker = ImagePicker();

  UserProfileUploadService uploadService = UserProfileUploadService();

  String? imgUrl;
  File? profileImage;

  @override
  void initState() {
    super.initState();
    context.read<UserProfilDataCubit>().userProfilAllData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfilDataCubit, UserProfilDataCubitState>(
      builder: (context, state) {
        if (state is UserProfilDataCubitError) {
          return Center(
            child: CustomTextView(
              textPaste: state.error,
              textSize: 14,
              textColor: Colors.white,
            ),
          );
        }
        if (state is UserProfilDataCubitLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserProfilDataCubitLoaded) {
          imgUrl = state.dataModel.image!;
          return Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: profileEditImageColor,
            ),
            child: state.dataModel.image == null
                ? FakeProfilePhoto()
                : BlocBuilder<UserProfileUploadCubit, UserProfileUploadState>(
                    builder: (context, state) {
                      if (state is UserProfileUploadLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GestureDetector(
                        onTap: () async {
                          XFile? image = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 50,
                          );
                          if (image != null) {
                            profileImage = File(image.path);
                            BlocProvider.of<UserProfileUploadCubit>(context)
                                .userProfileUploadCubit(
                              userProfileImgUrl: profileImage,
                            );
                          } else {
                            debugPrint("Not Selected Image");
                          }
                          context
                              .read<UserProfilDataCubit>()
                              .userProfilAllData();
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: profileEditImageColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                imgUrl!,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: buttonColor.withOpacity(0.9),
                                  child: Image.asset(
                                    "assets/ellipse_icon.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 6,
                                  ),
                                  child: CustomTextView(
                                    textPaste: "edit",
                                    textSize: 10,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
