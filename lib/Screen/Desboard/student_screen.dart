import 'package:coach_app/Controller/coures_controller.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/custom_appbar_widget.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Data/Model/get_buy_user_response_model.dart';
import '../../Utils/app_color.dart';
import '../../Utils/string_constant.dart';

class StudenScreen extends StatefulWidget {
  const StudenScreen({super.key});

  @override
  State<StudenScreen> createState() => _StudenScreenState();
}

class _StudenScreenState extends State<StudenScreen> {
  CouresController couresController = Get.put(CouresController());
  @override
  void initState() {
    super.initState();
    couresController.buyUserData(context: context);
    _filteredData.addAll(couresController.buyCourseList);
  }

  final RxList<Paymentdata> _filteredData = <Paymentdata>[].obs;

  void _filterSearchResults({required String query}) {
    List<Paymentdata> dummySearchList = [];
    dummySearchList.addAll(couresController.buyCourseList);
    if (query.isNotEmpty) {
      List<Paymentdata> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.course!.courseName
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            item.user!.username
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(couresController.buyCourseList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => isInternetAvailable.value == true
            ? Scaffold(
                appBar: const CustomAppBar(
                    titleText: "All user", isLeadingButton: false),
                body: Center(
                  child: Column(
                    children: [
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: couresController.searchController,
                          onChanged: (value) {
                            _filterSearchResults(query: value);
                          },
                          style: GoogleFonts.lora(),
                          maxLines: 1,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              Assets.assetsSearch,
                              scale: 25,
                              color: AppColor.blueColor,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                 _filterSearchResults(query: "");
                                couresController.searchController.clear();
                              },
                              child: Image.asset(
                                Assets.assetsClear,
                                scale: 25,
                                color: AppColor.blueColor,
                              ),
                            ),
                            fillColor: AppColor.fillColor,
                            filled: true,
                            hintStyle: GoogleFonts.lora(),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 3.5.w),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.blueColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.blueColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.blueColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.redColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "search here...",
                          ),
                        ),
                      ),
                    
                      _filteredData.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                itemCount:
                                    _filteredData.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: customfillContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 10.h,
                                                  width: 10.h,
                                                  decoration: BoxDecoration(
                                                      // shape: BoxShape.circle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${_filteredData[index].user!.image}"),
                                                          fit: BoxFit.fill),
                                                      border: Border.all(
                                                          color: AppColor
                                                              .blueColor)),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    richText(
                                                        text1: "User Name : ",
                                                        text2:
                                                            "${_filteredData[index].user!.username}",
                                                        fontWeight1:
                                                            FontWeight.bold,
                                                        fontWeight2:
                                                            FontWeight.normal),
                                                    richText(
                                                        text1: "Course : ",
                                                        text2:
                                                            "${_filteredData[index].course!.courseName}",
                                                        fontWeight1:
                                                            FontWeight.bold,
                                                        fontWeight2:
                                                            FontWeight.normal),
                                                    richText(
                                                        text1: "Price : ",
                                                        text2:
                                                            "${_filteredData[index].course!.price} \u{20B9}",
                                                        fontWeight1:
                                                            FontWeight.bold,
                                                        fontWeight2:
                                                            FontWeight.normal),
                                                    richText(
                                                        text1:
                                                            "Primum month : ",
                                                        text2:
                                                            "${_filteredData[index].totalMounth} Month",
                                                        fontWeight1:
                                                            FontWeight.bold,
                                                        fontWeight2:
                                                            FontWeight.normal),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                customText("View details",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                                nextButton(onTap: () {
                                                  Get.toNamed(
                                                      Routes
                                                          .STUDENT_DETAILE_SCREEN,
                                                      arguments: _filteredData[
                                                          index]);
                                                }),
                                              ],
                                            ),
                                          ],
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
                            ))),
                    ],
                  ),
                ),
              )
            : noInertnet(top: 267),
      ),
    );
  }
}
