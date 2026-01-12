import 'package:coach_app/Controller/auth_controller.dart';
import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Controller/menu_controller.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/string_constant.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  AutheticationController autheticationController = Get.find();
  DashboardController dashboardController = Get.put(DashboardController());
  MenuBarController menuController = Get.put(MenuBarController());
  @override
  void initState() {
    super.initState();
    menuController.currentUser(context: context);
    // autheticationController.currentUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          Assets.assetsLogo,
                          scale: 4,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        customfillContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText("Name"),
                                customText(
                                  "${menuController.userDataList.value.username}",
                                  fontSize: 12.sp,
                                  color: AppColor.blueColor,
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                customText("Eamil"),
                                customText(
                                  "${menuController.userDataList.value.email}",
                                  fontSize: 12.sp,
                                  color: AppColor.blueColor,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText("Update your details",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                    nextButton(
                                      onTap: () {
                                        Get.toNamed(Routes.EDIT_PROFILE_SCREEN);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        customfillContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText("Change Password",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                                nextButton(onTap: () {
                                  Get.toNamed(Routes.CHANGE_PASSWORD_SCREEN);
                                }),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        customfillContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText("About Us",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                    nextButton(onTap: () {
                                      dashboardController.aboutUs(
                                          context: context);
                                    }),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText("Contact Us",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                    nextButton(onTap: () {
                                      dashboardController.contactUs(
                                          context: context);
                                    }),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText("Terms of use",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                    nextButton(onTap: () {
                                      dashboardController.termsOfUse(
                                          context: context);
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
