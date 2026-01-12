import 'package:coach_app/Controller/coures_controller.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Data/Model/coures_response_model.dart';

class CouresViewScreen extends StatefulWidget {
  const CouresViewScreen({super.key});

  @override
  State<CouresViewScreen> createState() => _CouresViewScreenState();
}

class _CouresViewScreenState extends State<CouresViewScreen> {
  CouresController couresController = Get.put(CouresController());

  Coursedata coursedata = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: CustomAppBar(
                  titleText: "${coursedata.courseName}",
                  isLeadingButton: true,
                  isActionsButton: true,
                  isActionsExtraButton: false,
                  actionicon: Assets.assetsEdit,
                  actionextraicon: Assets.assetsDelete,
                  actionsOnTap: () {
                    couresController.selcteCategoryValue.value =
                        coursedata.categoryId ?? 0;
                    couresController.titleController.text =
                        coursedata.courseName!;
                    couresController.descriptionController.text =
                        coursedata.courseDes!;
                    couresController.feeController.text =
                        coursedata.price!.toString();
                    couresController.currentBannerImage.value =
                        coursedata.bannerimage!;
                    couresController.currentCouresId.value = coursedata.id ?? 0;
                    couresController.initSwitchValue.value = coursedata.enable!;
                    couresController.switchcontroller.value = ValueNotifier<bool>(coursedata.enable!) ;
                    Get.toNamed(Routes.COURES_ADD_SCREEN,
                        arguments: ["edit", coursedata.id]);
                  },
                  actionsextraOnTap: () {
                    deleteAlert(context, onPressed: () {
                      couresController.couresDeleteData(
                        context: context,
                        coureseId: coursedata.id,
                        categoryId: coursedata.categoryId,
                      );
                    });
                  },
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 25.h,
                          // width: 85.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    coursedata.bannerimage.toString()),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customText(
                            // "As an Android Developer, the developers use a number of IDE for writing the code for the Application. For example, Android Studio, Eclipse, Visual Studio (in some cases), etc. But the most popular and recommended one among these IDEs is the Android Studio. Nowadays, every Android Developer uses Android Studio to write codes for their Application because Android Studio provides us a lot of functionalities and features, that make the speed of writing codes fast. Also, the developers get an organized way to manage their project in Android Studio. So in this article, we are going to discuss the top 20 tricks, shortcuts of Android Studio that will help you in improving your overall performance."),
                            "${coursedata.courseDes}"),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (couresController.videoList.isNotEmpty) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText("Curriculum",
                                  fontSize: 13.sp, fontWeight: FontWeight.bold),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.ALL_VIDEO_SCREEN,
                                        arguments: coursedata);
                                  },
                                  child: customText("See All",
                                      color: AppColor.blueColor)),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              itemCount: couresController.videoList.length <= 4
                                  ? couresController.videoList.length
                                  : 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (contex, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.VIDEO_SCREEN,arguments: couresController.videoList[index].videoLink);
                                    },
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: AppColor.blueColor,
                                          image: DecorationImage(
                                              image: NetworkImage(coursedata
                                                  .bannerimage
                                                  .toString()),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Stack(children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white60,
                                            child: Image.asset(
                                                Assets.assetsPlayicon,
                                                scale: 2),
                                          ),
                                        ),
                                     
                                      ]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                        customText("Fees",
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 6.h,
                          decoration: BoxDecoration(
                              color: AppColor.fillColor,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 5.w),
                          child: customText("${coursedata.price} \u{20B9}",
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customButton(
                            text: "Add Video",
                            width: double.infinity,
                            height: 6.h,
                            onPressed: () {
                              couresController.clearVideoData();
                              // if (coureseKey.currentState!.validate()) {
                              videoAlert(
                                context,
                                screen: "add",
                                onPressed: () {
                                  if (videoaadKey.currentState!.validate()) {

                                    couresController.addVideoData(
                                        context: context,
                                        courseId: coursedata.id);
                                  }
                                },
                              );
                              // }
                            }),
                        SizedBox(
                          height: 2.h,
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
