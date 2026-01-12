// ignore_for_file: use_build_context_synchronously

import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ConatctUsScreen extends StatefulWidget {
  const ConatctUsScreen({super.key});

  @override
  State<ConatctUsScreen> createState() => _ConatctUsScreenState();
}

class _ConatctUsScreenState extends State<ConatctUsScreen> {
  DashboardController dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: const CustomAppBar(
                  isLeadingButton: true,
                  titleText: "Contact Us",
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        customText("Surat Corporate Office :",
                            color: AppColor.blueColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 2.h,
                        ),
                        customfillContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //  address
                                        customText(
                                          '${dashboardController.contactUsDetails.value.data!.address}',
                                          color: AppColor.blackColor,
                                          fontSize: 12.sp,
                                        ),

                                        SizedBox(
                                          height: 2.h,
                                        ),

                                        // tel no
                                        customText(
                                          'Tel 1: ${dashboardController.contactUsDetails.value.data!.contactno1}',
                                          color: AppColor.blackColor,
                                          fontSize: 12.sp,
                                        ),

                                        SizedBox(
                                          height: 1.h,
                                        ),

                                        //  rapnet
                                        customText(
                                          'Tel 2: ${dashboardController.contactUsDetails.value.data!.contactno2}',
                                          color: AppColor.blackColor,
                                          fontSize: 12.sp,
                                        ),

                                        SizedBox(
                                          height: 1.h,
                                        ),

                                        // email id
                                        GestureDetector(
                                          onTap: () async {
                                            EmailContent email = EmailContent(
                                              to: [
                                                '${dashboardController.contactUsDetails.value.data!.email}',
                                              ],
                                              subject: '',
                                              body: '',
                                            );

                                            OpenMailAppResult result =
                                                await OpenMailApp
                                                    .composeNewEmailInMailApp(
                                                        nativePickerTitle:
                                                            'Select email app to compose',
                                                        emailContent: email);
                                            if (!result.didOpen &&
                                                !result.canOpen) {
                                              // showNoMailAppsDialog(context);
                                            } else if (!result.didOpen &&
                                                result.canOpen) {
                                              showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    MailAppPickerDialog(
                                                  mailApps: result.options,
                                                  emailContent: email,
                                                ),
                                              );
                                            }
                                          },
                                          child: richText(
                                            text1: "Email: ",
                                            text2:
                                                "${dashboardController.contactUsDetails.value.data!.email}",
                                            color1: AppColor.blackColor,
                                            fontWeight1: FontWeight.normal,
                                            fontWeight2: FontWeight.normal,
                                            fontSize1: 12.sp,
                                            color2: AppColor.blueColor,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              // telegram
                              GestureDetector(
                                onTap: () {
                                  // var telegramNO = dashboardController.contactUsDetails.value.data!.telegramno.toString().replaceAll(" ", "");
                                  var telegramNO = "+917043401527";
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  // var telegramUrl = "https://t.me/gulfiza_hop";
                                  // var telegramUrl = "https://telegram.me/+971524434135";
                                  var telegramUrl = "https://t.me/$telegramNO";
                                  try {
                                    if (kDebugMode) {
                                      print(telegramUrl);
                                    }
                                    // ignore: deprecated_member_use
                                    launch(telegramUrl);
                                  } catch (e) {
                                    //To handle error and display error message
                                    errorSnackBar(
                                      message: "Unable to open Telegram",
                                    );
                                  }
                                },
                                child: Image.asset(
                                  Assets.assetsTelegram,
                                  scale: 10,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              // whatsapp
                              GestureDetector(
                                onTap: () async {
                                  // var whatsappno = dashboardController.contactUsDetails.value.data!.whatsappno.toString().replaceAll(" ", "");
                                  var whatsappno = "+917043401527";
                                  // To remove the keyboard when button is pressed
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  var whatsappUrl =
                                      "whatsapp://send?phone=$whatsappno";

                                  try {
                                    // ignore: deprecated_member_use
                                    await launch(whatsappUrl);
                                  } catch (e) {
                                    //To handle error and display error message
                                    errorSnackBar(
                                      message: "Unable to open whatsapp",
                                    );
                                  }
                                },
                                child: Image.asset(
                                  Assets.assetsWhatsapp,
                                  scale: 10,
                                ),
                              ),
                            ],
                          ),
                        )
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
