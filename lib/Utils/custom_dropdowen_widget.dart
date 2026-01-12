// ignore_for_file: must_be_immutable

/* ***************************** Custom DropDown ****************************** */


import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyDropDown extends StatelessWidget {
  final List<Map<String,dynamic>> items;
  final int? value;
  final String hintText;
  final void Function(int?) onChnaged;
  final double? width;
  final double? maxHeight;
  const MyDropDown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChnaged,
    required this.hintText,
    this.maxHeight,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        hint: customText(
          hintText,
        ),
        items: items
            .map(
              (Map<String,dynamic> item) => DropdownMenuItem<int>(
                value: item['id'] as int,
                child: customText(
                  (item['text'] as String).capitalize!,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                ),
              ),
            )
            .toList(),
        value: value,
        onChanged: (int? value) {
          onChnaged(value!);
        },
        buttonStyleData: ButtonStyleData(
          height: 48,
          width: 90.w,
          padding: const EdgeInsets.only(left: 14, right: 5),
          decoration: BoxDecoration(
            color: AppColor.fillColor,
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Image.asset(
              Assets.assetsDownArrow,
              color: AppColor.blueColor,
              height: 10,
              width: 10,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: maxHeight,
          width: width,
          direction: DropdownDirection.left,
          decoration: BoxDecoration(
            color: AppColor.lightfillColor,
            borderRadius: BorderRadius.circular(7.sp),
          ),
          padding: EdgeInsets.zero,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          overlayColor: MaterialStatePropertyAll(AppColor.fillColor)
        ),
      ),
    );
  }
}