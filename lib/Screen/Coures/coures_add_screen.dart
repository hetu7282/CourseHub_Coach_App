// ignore_for_file: prefer_typing_uninitialized_variables, invalid_use_of_protected_member, sort_child_properties_last

import 'dart:developer';
import 'package:coach_app/Controller/coures_controller.dart';
import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Controller/menu_controller.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/custom_dropdowen_widget.dart';
import 'package:coach_app/Utils/custom_textfiled.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/string_constant.dart';

class CouresAddScreen extends StatefulWidget {
  const CouresAddScreen({super.key});

  @override
  State<CouresAddScreen> createState() => _CouresAddScreenState();
}

class _CouresAddScreenState extends State<CouresAddScreen> {
  DashboardController dashboardController = Get.find();
  CouresController couresController = Get.put(CouresController());
  MenuBarController menuController = Get.put(MenuBarController());
  GlobalKey<FormState> coureseKey = GlobalKey<FormState>();
  List templist = [1];
  var screen = Get.arguments[0];
  var courseId = Get.arguments[1];

  @override
  void initState() {
    super.initState();
    log("id ::::::::::::::: ${couresController.selcteCategoryValue.value}");
    if (screen == "add") {
      couresController.selcteCategoryValue.value =
          dashboardController.categoryList[0].id ?? 0;
    }
  }

  @override
  void dispose() {
    menuController.imageShow = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
          child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: CustomAppBar(
                    isActionwidget: screen == "add" ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: AdvancedSwitch(
                        initialValue: couresController.initSwitchValue.value,
                        onChanged: (value) {
                          print("Value :::: $value");
                          setState(() {
                            couresController.enableCouresUpdateData(
                              context: context,
                              courseId: courseId,
                              enable: value,
                            );
                          });
                        },
                        width: 50,
                        height: 25,
                        controller: couresController.switchcontroller.value,
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                    titleText: screen == "add" ? "Add Course" : "Update Course",
                    isLeadingButton: true),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: coureseKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            "Banner Image",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   height: 20.h,
                          //   decoration: BoxDecoration(
                          //       color: AppColor.lightblueColor,
                          //       borderRadius: BorderRadius.circular(15),
                          //       border: Border.all(color: AppColor.blueColor)),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.add,
                          //         color: AppColor.blueColor,
                          //         size: 20.sp,
                          //       ),
                          //       customText("Upload Banner", fontSize: 12.sp),
                          //     ],
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              //  Platform.isAndroid
                              //                     ? menuController
                              //                         .permissionStorage(
                              //                             context)
                              //                     : menuController
                              //                         .permissionPhotos(
                              //                             context);
                              menuController.openGallery(ImageSource.gallery);

                              // menuController.pickProfilePhoto(context, ImageSource.gallery);
                            },
                            child: GetBuilder<MenuBarController>(
                              builder: (_) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.lightblueColor,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color:
                                                menuController.imageShow != null
                                                    ? AppColor.whiteColor
                                                    : AppColor.blueColor)),
                                    height: 20.h,
                                    width: double.infinity,
                                    child: menuController.imageShow != null
                                        ? Image.file(
                                            menuController.imageShow,
                                            fit: BoxFit.cover,
                                          )
                                        : couresController
                                                    .currentBannerImage.value !=
                                                ""
                                            ? Image.network(
                                                couresController
                                                    .currentBannerImage.value,
                                                fit: BoxFit.cover,
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    color: AppColor.blueColor,
                                                    size: 20.sp,
                                                  ),
                                                  customText("Upload Banner",
                                                      fontSize: 12.sp),
                                                ],
                                              ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          customText(
                            "Categories",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),

                          Obx(
                            () {
                              return MyDropDown(
                                  items: dashboardController.categoryList.value
                                      .map((e) {
                                    return {'text': e.category, 'id': e.id};
                                  }).toList(),
                                  value: couresController
                                              .selcteCategoryValue.value ==
                                          0
                                      ? null
                                      : couresController
                                          .selcteCategoryValue.value,
                                  onChnaged: (value) {
                                    couresController.selcteCategoryValue.value =
                                        value!;
                                    log("cid ::::::::: ${couresController.selcteCategoryValue.value}");
                                  },
                                  hintText: 'Select Category');
                            },
                          ),

                          SizedBox(
                            height: 2.h,
                          ),
                          customText(
                            "Courese Title",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFiled(
                              hintText: "Title",
                              maxLines: 1,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  menuController.usernameController.clear();
                                  return 'Please enter title';
                                }
                                return null;
                              },
                              color: AppColor.transparent,
                              controller: couresController.titleController),

                          SizedBox(
                            height: 2.h,
                          ),
                          customText(
                            "Description",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFiled(
                              hintText: "Description",
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  menuController.usernameController.clear();
                                  return 'Please enter description';
                                }
                                return null;
                              },
                              contentPadding: const EdgeInsets.all(15),
                              color: AppColor.transparent,
                              maxLines: 8,
                              controller:
                                  couresController.descriptionController),
                          SizedBox(
                            height: 2.h,
                          ),
                          customText(
                            "Fees (Per Month)",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFiled(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  menuController.usernameController.clear();
                                  return 'Please enter fee';
                                }
                                final price = double.tryParse(value);
                                if (price == null || price <= 0) {
                                  return 'Please enter a valid price';
                                }

                                return null;
                              },
                              hintText: "Fee",
                              color: AppColor.transparent,
                              maxLines: 1,
                              controller: couresController.feeController),
                          SizedBox(
                            height: 2.h,
                          ),
                          customButton(
                              text: screen == "add"
                                  ? "Add Course"
                                  : "Update Course",
                              width: double.infinity,
                              height: 6.h,
                              onPressed: () {
                                if (coureseKey.currentState!.validate()) {
                                  if (screen == "add") {
                                    couresController.couresAddUploadImage(
                                        context,
                                        menuController.bytesImage,
                                        menuController.bannerImageName.value,
                                        id: couresController
                                            .selcteCategoryValue.value);
                                  } else {
                                    couresController.couresUpdateUploadImage(
                                        couresId: couresController
                                            .currentCouresId.value,
                                        context,
                                        menuController.bytesImage,
                                        menuController.bannerImageName.value,
                                        id: couresController
                                            .selcteCategoryValue.value);
                                  }
                                }
                              }),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : noInertnet(top: 267),
      )),
    );
  }
}
