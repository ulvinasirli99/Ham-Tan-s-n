import 'dart:io';

import 'package:everyone_know_app/color/app_color.dart';
import 'package:everyone_know_app/component/custom_appbar.dart';
import 'package:everyone_know_app/component/custom_button.dart';
import 'package:everyone_know_app/domain/state/create_status_cubit/create_status_cubit.dart';
import 'package:everyone_know_app/utils/size/size.dart';
import 'package:everyone_know_app/view/text/text_view.dart';
import 'package:everyone_know_app/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddStatusScreen extends StatefulWidget {
  const AddStatusScreen({Key? key}) : super(key: key);

  @override
  _AddStatusScreenState createState() => _AddStatusScreenState();
}

class _AddStatusScreenState extends State<AddStatusScreen> {
  File? imageFile;
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveWidget(
          child: BlocBuilder<CreateStatusCubit, CreateStatusState>(
            builder: (context, state) {
              if (state is CreateStatusLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CreateStatusLoaded) {
                Fluttertoast.showToast(
                    msg: "Status ugurla yaradildi : " +
                        state.createStatus.text.toString());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBarComponent(appBarText: "Əlavə et"),
                  SizedBox(
                    height: screenHeight(context, 0.05),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        XFile? image = await imagePicker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                        );
                        setState(() {
                          if (image != null) {
                            imageFile = File(image.path);
                          } else {
                            debugPrint("Error : Not found");
                          }
                        });
                      },
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: imageFile == null
                            ? const Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                  color: Colors.black,
                                ),
                              )
                            : Image.file(imageFile!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 21,
                      top: screenHeight(context, 0.07),
                    ),
                    child: const CustomTextView(
                      textPaste: "Təsvir",
                      textSize: 16,
                      textColor: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: screenHeight(context, 0.2),
                    margin: const EdgeInsets.only(
                      left: 21,
                      right: 21,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(218, 225, 243, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 11,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          hintText: "Qeydi bura əlavə edin",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: textColorGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: CustomButton(
                      buttonTextPaste: "Yekunlaşdır",
                      callback: () {
                        BlocProvider.of<CreateStatusCubit>(context)
                            .createStatusCubit(
                          "1",
                          textEditingController.text,
                          image: imageFile,
                        );
                        Fluttertoast.showToast(
                          msg: "Status ugurla yaradildi",
                          toastLength: Toast.LENGTH_LONG,
                        );
                        setState(() {
                          imageFile = null;
                          textEditingController.text = "";
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
