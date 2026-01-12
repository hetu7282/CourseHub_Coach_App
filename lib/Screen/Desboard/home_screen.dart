import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:coach_app/Controller/auth_controller.dart';
import 'package:coach_app/Controller/coures_controller.dart';
import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Controller/menu_controller.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashboardController dashboardController = Get.find();
  MenuBarController menuBarController = Get.put(MenuBarController());

  AutheticationController autheticationController =
      Get.put(AutheticationController());
  CouresController couresController = Get.put(CouresController());
  @override
  void initState() {
    super.initState();
    menuBarController.currentUser(context: context);

    if (dashboardController.categoryList.isNotEmpty) {
      couresController.categoryData(
          context: context, categoryId: dashboardController.categoryList[0].id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    couresController.clearCouresData();
                    Get.toNamed(Routes.COURES_ADD_SCREEN,
                        arguments: ["add", 0]);
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                body: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await GetStorage().erase();
                              Get.offAllNamed(Routes.LOGIN_SCREEN);
                            },
                            child: Image.asset(
                              Assets.assetsLogout,
                              scale: 2.5,
                              color: AppColor.blueColor,
                            ),
                          ),
                          const Spacer(),
                          menuBarController.userDataList.value.username != null
                              ? customText(
                                  "Welcome ${menuBarController.userDataList.value.username.toString()}",
                                  // "Welcone Home",
                                  color: AppColor.blueColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)
                              : Container(),
                          const Spacer()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CarouselSlider(
                      items:
                          dashboardController.sliderImageList.map((imagePath) {
                        return Builder(builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              //banner image
                              child: Image.network(
                                  imagePath.imagerul.toString(),
                                  fit: BoxFit.fill),
                            ),
                          );
                        });
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: SizerUtil.deviceType == DeviceType.mobile
                            ? 20 / 9
                            : 15 / 6,
                        onPageChanged: (index, _) {
                          // welcomeController.currentIndex.value =
                          //     index;
                        },
                      ),
                      carouselController:
                          dashboardController.imagesildercontroller,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: dashboardController.categoryList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (contex, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  dashboardController.currentIndex.value =
                                      index;
                                  couresController.categoryData(
                                      context: context,
                                      categoryId: dashboardController
                                          .categoryList[index].id);
                                },
                                child: customContainer(
                                    text: dashboardController
                                        .categoryList[index].category
                                        .toString(),
                                    textcolor: dashboardController
                                                .currentIndex.value ==
                                            index
                                        ? AppColor.whiteColor
                                        : AppColor.blueColor,
                                    color: dashboardController
                                                .currentIndex.value ==
                                            index
                                        ? AppColor.blueColor
                                        : AppColor.lightblueColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    couresController.couresList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: couresController.couresList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                DateFormat dateFormat =
                                    DateFormat("yyyy-MM-dd HH:mm:ss");
                                DateTime dateTime = dateFormat.parse(
                                    "${couresController.couresList[index].createdAt}");
                                log(timeago.format(dateTime));
                                // DateTime time =
                                //     // DateTime.parse("${couresController.couresList[index].createdAt}");
                                //     DateTime.parse("2024-03-08 9:33:17");
                                // log(timeago.format(time));
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      couresController.videoData(
                                          context: context,
                                          courseId: couresController
                                              .couresList[index].id);
                                      Get.toNamed(Routes.COURES_VIEW_SCREEN,
                                          arguments: couresController
                                              .couresList[index]);
                                    },
                                    child: customfillContainer(
                                      // color: AppColor.blueColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                customText(
                                                    "${couresController.couresList[index].courseName}",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                                const Spacer(),
                                                customText(
                                                    timeago.format(dateTime),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            customText(
                                                "${couresController.couresList[index].courseDes}",
                                                maxLine: 5,
                                                overflow: TextOverflow.ellipsis)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Expanded(
                            child: Center(
                              child: customText(
                                "No data avaliable",
                                fontSize: 15.sp,
                                color: AppColor.blueColor,
                              ),
                            ),
                          ),
                  ],
                ),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
