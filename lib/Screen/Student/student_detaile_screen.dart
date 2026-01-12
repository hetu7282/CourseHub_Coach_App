import 'package:coach_app/Data/Model/get_buy_user_response_model.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/custom_appbar_widget.dart';

class StudentDetileScreen extends StatefulWidget {
  const StudentDetileScreen({super.key});

  @override
  State<StudentDetileScreen> createState() => _StudentDetileScreenState();
}

class _StudentDetileScreenState extends State<StudentDetileScreen> {
  Paymentdata paymentdata = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: const CustomAppBar(
                  isLeadingButton: true,
                  titleText: "User",
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: customfillContainer(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: BoxDecoration(
                              color: AppColor.lightblueColor,
                              border: Border.all(
                                color: AppColor.unselectediconColor,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${paymentdata.user!.image}"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            richText(
                              text1: "Username\t:\t",
                              text2: "${paymentdata.user!.username}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Email\t:\t",
                              text2: "${paymentdata.user!.email}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Coures\t:\t",
                              text2: "${paymentdata.course!.courseName}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Mobile No\t:\t",
                              text2: "+91 ${paymentdata.user!.mobile}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Coures Price\t:\t",
                              text2:
                                  "${paymentdata.course!.price} \u{20B9} (Per Month)",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Pay Month\t:\t",
                              text2: "${paymentdata.totalMounth}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Date\t:\t",
                              text2: "${paymentdata.startDate}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Expire Date\t:\t",
                              text2: "${paymentdata.expireDate}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            richText(
                              text1: "Total Amount\t:\t",
                              text2: "${paymentdata.totalAmount} \u{20B9}",
                              color1: AppColor.blueColor,
                              color2: AppColor.blackColor,
                              fontWeight1: FontWeight.normal,
                              fontWeight2: FontWeight.bold,
                              fontSize1: 14.sp,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 12.w,
                            ),
                            // telegram
                            GestureDetector(
                              onTap: () {
                                var telegramNO =
                                    "${paymentdata.user!.telegramno}";
                                // var telegramNO = "+917043401527";
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
                                var whatsappno =
                                    "${paymentdata.user!.whatsapp}";
                                // var whatsappno = "+917043401527";
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
                        )
                      ],
                    )),
                  ),
                ),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
