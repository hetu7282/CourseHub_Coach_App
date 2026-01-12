// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, unused_element, non_constant_identifier_names

import 'dart:io';

import 'package:coach_app/Controller/menu_controller.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_textfiled.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:coach_app/generated/assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/custom_appbar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  MenuBarController menuController = Get.put(MenuBarController());

  GlobalKey<FormState> profileKey = GlobalKey<FormState>();
  // String selectedValue = "";
  // File? _pickedImage;
  // var imagename;
  // Uint8List webImage = Uint8List(8);
  // String downloadUrl = "";
  // XFile? image;

  // Future<void> _pickImage() async {
  //   if (!kIsWeb) {
  //     final ImagePicker picker = ImagePicker();
  //     image = await picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var Selected = File(image!.path);
  //       setState(() {
  //         _pickedImage = Selected;
  //       });
  //     } else {
  //       log("No Image has been picked...");
  //     }
  //   } else if (kIsWeb) {
  //     setState(() {});
  //     final ImagePicker picker = ImagePicker();
  //     image = await picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var f = await image!.readAsBytes();
  //       setState(() {
  //         webImage = f;
  //         _pickedImage = File('a');
  //       });
  //     } else {
  //       log("No Image has been picked...");
  //     }
  //   } else {
  //     log("Something want wrong");
  //   }
  // }
  @override
  void dispose() {
    super.dispose();
    menuController.imageShow = null;
  }

  @override
  void initState() {
    super.initState();
    menuController.imageShow;
    print(menuController.imageShow);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Obx(
          () => isInternetAvailable.value == true
              ? Scaffold(
                  appBar: const CustomAppBar(
                    isLeadingButton: true,
                    titleText: "Edit",
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: profileKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                              child: Card(
                                color: AppColor.transparent,
                                elevation: 50.sp,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: GetBuilder<MenuBarController>(
                                  builder: (controller) {
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          child: SizedBox(
                                            height: 220,
                                            width: 220,
                                            child: menuController.imageShow !=
                                                    null
                                                ? Image.file(
                                                    menuController.imageShow,
                                                    fit: BoxFit.cover,
                                                  )
                                                : menuController.currentImage !=
                                                        ""
                                                    ? Image.network(
                                                        menuController
                                                            .currentImage,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        Assets.assetsProfile,
                                                        fit: BoxFit.cover,
                                                      ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 3.h,
                                          right: 2,
                                          child: GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Card(
                                                      child: SizedBox(
                                                        height: 20.h,
                                                        // color: CustomColor.backgroung,
                                                        // color: CustomColor.white,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  // menuController
                                                                  //     .permissionCamera(
                                                                  //         context);
                                                                  menuController.pickProfilePhoto(
                                                                      context,
                                                                      ImageSource
                                                                          .camera);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: ListTile(
                                                                  leading: Image
                                                                      .asset(Assets
                                                                          .assetsCameraIcon),
                                                                  title: customText(
                                                                      "Camera",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )),
                                                            Divider(
                                                              endIndent: 8.w,
                                                              indent: 8.w,
                                                              thickness: 0.5,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  // Platform.isAndroid
                                                                  //     ? menuController
                                                                  //         .permissionStorage(
                                                                  //             context)
                                                                  //     : menuController
                                                                  //         .permissionPhotos(
                                                                  //             context);
                                                                  menuController.pickProfilePhoto(
                                                                      context,
                                                                      ImageSource
                                                                          .gallery);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: ListTile(
                                                                  leading: Image
                                                                      .asset(Assets
                                                                          .assetsGalleryIcon),
                                                                  title:
                                                                      customText(
                                                                    "Gallery",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 0.5.w,
                                                    color: Colors.white),
                                                color: AppColor.blueColor,
                                              ),
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 15.sp,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText("Username",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                  hintText: "Username",
                                  controller: menuController.usernameController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      menuController.usernameController.clear();
                                      return 'Please enter username';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Email",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    hintText: "Email",
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      RegExp emailRegExp = RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                      if (value!.trim().isEmpty) {
                                        menuController.emailController.clear();
                                        return 'Please enter email';
                                      } else if (!emailRegExp.hasMatch(value)) {
                                        return 'Enter valid email address';
                                      }
                                      return null;
                                    },
                                    controller: menuController.emailController),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Gender",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          title: const Text("Male"),
                                          value: "male",
                                          groupValue:
                                              menuController.gender.value,
                                          onChanged: (value) {
                                            menuController.gender.value =
                                                value.toString();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: const Text("Female"),
                                          value: "female",
                                          groupValue:
                                              menuController.gender.value,
                                          onChanged: (value) {
                                            menuController.gender.value =
                                                value.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Mobile No",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    hintText: "Mobile No",
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        menuController.phnoController.clear();
                                        return 'Please enter mobile no';
                                      } else if (value.length != 10) {
                                        return "Mobile number must be of 10 digit";
                                      }
                                      return null;
                                    },
                                    controller: menuController.phnoController),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Whatsapp No",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    hintText: "Whatsapp No",
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        menuController.watshappnoController
                                            .clear();
                                        return 'Please enter whatsapp no';
                                      } else if (value.length != 10) {
                                        return "Whatsapp number must be of 10 digit";
                                      }
                                      return null;
                                    },
                                    controller:
                                        menuController.watshappnoController),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Telegram No",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    keyboardType: TextInputType.phone,
                                    hintText: "Telegram No",
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        menuController.telegramController
                                            .clear();
                                        return 'Please enter telegram no';
                                      } else if (value.length != 10) {
                                        return "Telegram number must be of 10 digit";
                                      }
                                      return null;
                                    },
                                    controller:
                                        menuController.telegramController),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Experience",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    keyboardType: TextInputType.text,
                                    hintText: "Experience",
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        menuController.expController.clear();
                                        return 'Please enter experience';
                                      }
                                      return null;
                                    },
                                    controller: menuController.expController),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Country",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    keyboardType: TextInputType.text,
                                    hintText: "Country",
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        menuController.countryController
                                            .clear();
                                        return 'Please enter country';
                                      }
                                      return null;
                                    },
                                    controller:
                                        menuController.countryController),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("City",
                                    color: AppColor.blueColor,
                                    fontSize: 11.5.sp),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CustomTextFiled(
                                    keyboardType: TextInputType.text,
                                    hintText: "City",
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        menuController.cityController.clear();
                                        return 'Please enter city';
                                      }
                                      return null;
                                    },
                                    controller: menuController.cityController),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            customButton(
                                text: "Save",
                                onPressed: () {
                                  if (profileKey.currentState!.validate()) {
                                    menuController.profileUploadImage(
                                        id: menuController.currentUserDetails
                                            .value.userdata!.id,
                                        context,
                                        image: menuController.imageShow == null
                                            ? menuController.currentImage
                                            : menuController.bytesImage,
                                        name: menuController
                                            .bannerImageName.value,
                                        picimage:
                                            menuController.imageShow == null
                                                ? false
                                                : true);
                                  }
                                },
                                height: 5.h,
                                width: 85.w)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : noInertnet(top: 267),
        ),
      ),
    );
  }
}
