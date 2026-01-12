import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/custom_widget.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
   DashboardController dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => isInternetAvailable.value == true
              ?
      Scaffold(
        appBar: const CustomAppBar(
          isLeadingButton: true,
          titleText: "Terms Of Use",
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: customfillContainer(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: customText(
                     dashboardController.termsOfUseDetails.value.data!.terms.toString()),
                ),
              ),
            ),
          ),
        ),
      ): noInertnet(top: 267),),
    );
  }
}
