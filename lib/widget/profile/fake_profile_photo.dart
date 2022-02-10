import 'dart:io';

import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/domain/state/profile_img_upload_cubit/user_profile_upload_cubit.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class FakeProfilePhoto extends StatelessWidget {
  FakeProfilePhoto({Key? key}) : super(key: key);
  final ImagePicker imagePicker = ImagePicker();
  File? profileImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
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
      },
      child: BlocBuilder<UserProfileUploadCubit, UserProfileUploadState>(
        builder: (context, state) {
          if (state is UserProfileUploadLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: profileEditImageColor,
            ),
            child: profileImage != null
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: buttonColor.withOpacity(0.3),
                          child: Image.asset(
                            "assets/ellipse_icon.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.file(
                          profileImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: CustomTextView(
                          textPaste: "M",
                          textSize: 30,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: buttonColor.withOpacity(0.3),
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
          );
        },
      ),
    );
  }
}
