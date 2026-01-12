import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Controller/menu_controller.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/custom_textfiled.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/string_constant.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  MenuBarController menuController = Get.put(MenuBarController());
  DashboardController dashboardController = Get.put(DashboardController());
  GlobalKey<FormState> changepwdKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    menuController.oldController.clear();
    menuController.newController.clear();
    menuController.conController.clear();
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
                    titleText: "Change Password",
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: changepwdKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Image.asset(
                              Assets.assetsLogo,
                              scale: 4,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFiled(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    menuController.oldController.clear();
                                    return 'Please enter old password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be atleast 6 characters long';
                                  }
                                  return null;
                                },
                                hintText: "Enter Password",
                                controller: menuController.oldController),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextFiled(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    menuController.newController.clear();
                                    return 'Please enter new password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be atleast 6 characters long';
                                  }
                                  return null;
                                },
                                hintText: "Enter New Password",
                                controller: menuController.newController),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextFiled(
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    menuController.conController.clear();
                                    return 'Please enter confirm password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  } else if (menuController
                                          .newController.text !=
                                      menuController.conController.text) {
                                    return "Passwords doesn't match";
                                  }
                                  return null;
                                },
                                hintText: "Enter Confirm Password",
                                controller: menuController.conController),
                            SizedBox(
                              height: 4.h,
                            ),
                            customButton(
                              text: "Save",
                              onPressed: () {
                                if (changepwdKey.currentState!.validate()) {
                                  // Get.back();
                                  dashboardController.chnagePassword(
                                      context: context,
                                      password:
                                          menuController.conController.text);
                                }
                              },
                              height: 6.h,
                              width: 90.w,
                            ),
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
