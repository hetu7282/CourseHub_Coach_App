import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/deshboard_controller.dart';
import '../../Utils/custom_appbar_widget.dart';
import '../../Utils/custom_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
   DashboardController dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: const CustomAppBar(
                  isLeadingButton: true,
                  titleText: "About Us",
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: customfillContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                "Welcome to CoachHub!  \n",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: AppColor.blueColor,
                              ),
                              customText(
                                  '${dashboardController.aboutUsDetails.value.data!.aboutus}\n'),
                              customText("Thank you for choosing CourseHub!"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
