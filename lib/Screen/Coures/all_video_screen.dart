import 'package:coach_app/Data/Model/coures_response_model.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/coures_controller.dart';

class AllVideoScreen extends StatefulWidget {
  const AllVideoScreen({super.key});

  @override
  State<AllVideoScreen> createState() => _AllVideoScreenState();
}

class _AllVideoScreenState extends State<AllVideoScreen> {
  CouresController couresController = Get.find();
  @override
  void initState() {
    super.initState();

    switchValues.clear();
    switchValues.value = List.generate(
        couresController.videoList.length,
        (index) =>
            ValueNotifier<bool>(couresController.videoList[index].enable!));
    // ValueNotifier<bool>(false));
  }

  RxList<ValueNotifier<bool>> switchValues = <ValueNotifier<bool>>[].obs;
  Coursedata coursedata = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: const CustomAppBar(
                    titleText: "All Video", isLeadingButton: true),
                body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: couresController.videoList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customfillContainer(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.VIDEO_SCREEN,arguments:couresController.videoList[index].videoLink );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: 160,
                                height: 13.h,
                                decoration: BoxDecoration(
                                    color: AppColor.blueColor,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            coursedata.bannerimage.toString()),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white60,
                                      child: Image.asset(Assets.assetsPlayicon,
                                          scale: 2),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      width: 44.w,
                                      child: customText(
                                        "${couresController.videoList[index].videoTitle}",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      width: 44.w,
                                      child: customText(
                                        // "Chapter ${index + 1}",
                                        "${couresController.videoList[index].videoSubtitle}",
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AdvancedSwitch(
                                          // initialValue: false,
                                          initialValue: couresController
                                                          .videoList[index].enable!,
                                          onChanged: (value) {
                                            print("Value :::: $value");
                                            setState(() {
                                              couresController
                                                  .enableVideoUpdateData(
                                                      context: context,
                                                      videoId: couresController
                                                          .videoList[index].id,
                                                      courseId: coursedata.id,
                                                      enable: value);
                                            });
                                          },
                                          width: 50,
                                          height: 25,
                                          controller: switchValues[index],
                                          borderRadius:
                                              BorderRadius.circular(29),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            couresController
                                                    .videotiltleController
                                                    .text =
                                                couresController
                                                    .videoList[index]
                                                    .videoTitle!;
                                            couresController
                                                    .videosubtiltleController
                                                    .text =
                                                couresController
                                                    .videoList[index]
                                                    .videoSubtitle!;
                                            couresController
                                                    .videolinkController.text =
                                                couresController
                                                    .videoList[index]
                                                    .videoLink!;
                                            videoAlert(
                                              context,
                                              screen: "edit",
                                              onPressed: () {
                                                if (videoaadKey.currentState!
                                                    .validate()) {
                                                  couresController
                                                      .updateVideoData(
                                                          context: context,
                                                          courseId: coursedata
                                                              .id,
                                                          videoId:
                                                              couresController
                                                                  .videoList[
                                                                      index]
                                                                  .id);
                                                }
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 4.h,
                                            width: 4.h,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColor.blueColor),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: const Icon(
                                              Icons.edit,
                                              color: AppColor.blueColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            couresController.deleteVideoData(
                                                context: context,
                                                courseId: coursedata.id,
                                                videoId: couresController
                                                    .videoList[index].id);
                                          },
                                          child: Container(
                                            height: 4.h,
                                            width: 4.h,
                                            decoration: BoxDecoration(
                                                color: AppColor.blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: const Icon(
                                              Icons.delete,
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
