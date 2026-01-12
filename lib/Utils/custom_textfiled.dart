// ignore_for_file: must_be_immutable

import 'package:coach_app/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  String? Function(String?)? validator;
  final TextEditingController controller;
  bool obscureText;
  int? maxLines;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  Widget? suffix;
  Color? color;EdgeInsetsGeometry? contentPadding;
  CustomTextFiled(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.textInputAction,
      this.maxLines,
      this.contentPadding,
      this.obscureText = false,
      this.inputFormatters,
      this.color,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        maxLines: maxLines,style:GoogleFonts.lora(),
        validator: validator,
        controller: controller,
        obscureText: obscureText,textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: AppColor.fillColor,
          filled: true,
          hintStyle: GoogleFonts.lora(),
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 3.5.w),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: color ?? AppColor.blueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
         
          border: OutlineInputBorder(
            borderSide:  BorderSide(
              color: color ?? AppColor.blueColor,
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
          hintText: hintText,
        ),
      ),
    );
  }
}
