import 'package:coach_app/Controller/coures_controller.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_textfiled.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_url_validator/video_url_validator.dart';

/* ***************************** Custom Button ****************************** */

SizedBox customButton(
    {void Function()? onPressed,
    String? text,
    var width,
    var height,
    double? fontSize,
    FontWeight? fontWeight}) {
  return SizedBox(
    width: width ?? 100,
    height: height ?? 30,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppColor.blueColor,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: customText(text!,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 17,
          color: AppColor.whiteColor),
    ),
  );
}

/* ***************************** Custom Text ****************************** */

Text customText(
  String content, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  int? maxLine,
  double? letterSpacing = 0.0,
  TextAlign? textAlign,
  double? height = 1.7,
  TextOverflow? overflow,
  TextDecoration? decoration,
  bool? softWrap,
  TextStyle? style,
}) {
  return Text(
    content,
    textAlign: textAlign,
    maxLines: maxLine,
    overflow: overflow,
    softWrap: softWrap,
    style: GoogleFonts.lora(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing,
    ),
  );
}

/* ***************************** Custom DataColumn ****************************** */

DataColumn dataColumn({required String text}) {
  return DataColumn(
      label: customText(
    text,
    color: AppColor.blackColor,
    fontSize: 20,
  ));
}

Container customContainer({
  required String text,
  Color? bordercolor,
  Color? textcolor,
  double? height,
  double? width,
  Color? color,
}) {
  return Container(
    height: height ?? 5.h,
    width: width ?? 25.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: color ?? AppColor.lightblueColor,
        border: Border.all(color: bordercolor ?? AppColor.blueColor),
        borderRadius: BorderRadius.circular(8)),
    child: customText(text, color: textcolor ?? AppColor.blueColor),
  );
}

Container customfillContainer({
  String? text,
  Color? bordercolor,
  Color? textcolor,
  double? height,
  Widget? child,
  double? width,
  Color? color,
}) {
  return Container(
    width: width ?? 90.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: color ?? AppColor.lightblueColor,
        border: Border.all(color: bordercolor ?? AppColor.unselectediconColor),
        borderRadius: BorderRadius.circular(8)),
    child: child ?? customText(text!, color: textcolor ?? AppColor.blueColor),
  );
}

GestureDetector nextButton({
  double? height,
  double? width,
  Color? color,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? 4.h,
      width: width ?? 4.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color ?? AppColor.nextButtonColor,
          borderRadius: BorderRadius.circular(8)),
      child: Image.asset(
        Assets.assetsNext,
        scale: 35,
        color: AppColor.blueColor,
      ),
    ),
  );
}

/* ***************************** Custom Button ****************************** */

SizedBox customOutlineButton(
    {void Function()? onPressed,
    String? text,
    var width,
    var height,
    double? fontSize,
    Widget? child}) {
  return SizedBox(
    width: width ?? 100,
    height: height ?? 30,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.lightblueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: AppColor.blueColor),
        // fixedSize: Size(35.w, 5.h),
        elevation: 0,
        shadowColor: AppColor.blueColor.withOpacity(0.9),
      ),
      child: child ??
          customText(text!,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 15,
              color: AppColor.blueColor),
    ),
  );
}

RichText richText(
    {String? text1,
    String? text2,
    TextOverflow? overflow,
    int? maxLines,
    double? fontSize,
    double? fontSize1,
    Color? color1,
    Color? color2,
    FontWeight? fontWeight1,
    FontWeight? fontWeight2,
    GestureRecognizer? recognizer}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      style: const TextStyle(
        height: 1.4,
        color: AppColor.blueColor,
      ),
      text: "",
      children: [
        TextSpan(
          text: "$text1",
          style: GoogleFonts.lora(
            color: color1 ?? AppColor.blackColor,
            fontSize: fontSize1 ?? 12.sp,
            fontWeight: fontWeight2 ?? FontWeight.normal,
            // fontFamily: fontFamilyphilosopherbold,
          ),
        ),
        TextSpan(
          style: GoogleFonts.lora(
            // fontFamily: fontFamilyphilosopherbold,
            fontWeight: fontWeight1 ?? FontWeight.w800,
            color: color2,
            fontSize: fontSize,
          ),
          text: "$text2",
          recognizer: recognizer,
        ),
      ],
    ),
    maxLines: maxLines,
  );
}

/* ***************************** No Internet Connection Image ****************************** */

noInertnet({double top = 0.0, double bottom = 0.0}) {
  return Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom),
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 30.h,
          child: Image.asset(
            Assets.assetsNointernet,
            fit: BoxFit.fill,
          ),
        ),
      ],
    ),
  );
}

GlobalKey<FormState> videoaadKey = GlobalKey<FormState>();
CouresController couresController = Get.put(CouresController());
Future<dynamic> videoAlert(BuildContext context,
    {void Function()? onPressed, var screen}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    // backgroundColor: Colors.transparent,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: videoaadKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    screen == "add" ? "Add Video" : "Edit Video",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  customText(
                    "Title",
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextFiled(
                    hintText: "Title",
                    maxLines: 1,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        couresController.videotiltleController.clear();
                        return 'Please enter title';
                      }
                      return null;
                    },
                    color: AppColor.transparent,
                    controller: couresController.videotiltleController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  customText(
                    "Subtitle",
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextFiled(
                    hintText: "Subtitle",
                    maxLines: 1,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        couresController.videosubtiltleController.clear();
                        return 'Please enter subtitle';
                      }
                      return null;
                    },
                    color: AppColor.transparent,
                    controller: couresController.videosubtiltleController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  customText(
                    "Video",
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextFiled(
                    hintText: "Video Link",
                    maxLines: 1,
                    validator: (value) {
                      var validator = VideoURLValidator();
                      if (value!.trim().isEmpty) {
                        couresController.videolinkController.clear();
                        return 'Please enter video link';
                      }
                      if (!validator.validateYouTubeVideoURL(url: value)) {
                        couresController.videolinkController.clear();

                        return 'Please enter a valid URL';
                      }
                      return null;
                    },
                    color: AppColor.transparent,
                    controller: couresController.videolinkController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          fixedSize: Size(25.w, 5.h),
                          elevation: 0,
                          shadowColor: AppColor.blueColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: customText(
                          overflow: TextOverflow.ellipsis,
                          "Cancel",
                          color: AppColor.whiteColor,
                          fontSize: 11.sp,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.lightblueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: const BorderSide(color: AppColor.blueColor),
                          fixedSize: Size(25.w, 5.h),
                          elevation: 0,
                          shadowColor: AppColor.blueColor.withOpacity(0.9),
                        ),
                        onPressed: onPressed,
                        child: customText(
                          overflow: TextOverflow.ellipsis,
                          screen == "add" ? "Add" : "Edit",
                          color: AppColor.blueColor,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<bool?> deleteAlert(BuildContext context,
    {required void Function()? onPressed}) {
  return showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        //note text
        title: customText(
          "Delete Coures",
          color: AppColor.blueColor,
          textAlign: TextAlign.left,
          fontSize: 15.sp,
        ),
        content: customText(
          "Are you sure you want to delete coures?",
          color: AppColor.blackColor,

          // textAlign: TextAlign.center,
          fontSize: 13.sp,
        ),

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  fixedSize: Size(15.w, 5.h),
                  elevation: 0,
                  shadowColor: AppColor.blueColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: customText(
                  overflow: TextOverflow.ellipsis,
                  "No",
                  color: AppColor.whiteColor,
                  fontSize: 11.sp,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.lightblueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(color: AppColor.blueColor),
                  fixedSize: Size(15.w, 5.h),
                  elevation: 0,
                  shadowColor: AppColor.blueColor.withOpacity(0.9),
                ),
                onPressed: onPressed,
                child: customText(
                  overflow: TextOverflow.ellipsis,
                  "Yes",
                  color: AppColor.blueColor,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
