// // ignore_for_file: camel_case_types, unused_field, prefer_typing_uninitialized_variables

// import 'dart:developer';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:coach_app/Utils/app_color.dart';
// import 'package:coach_app/Utils/custom_textfiled.dart';
// import 'package:coach_app/Utils/custom_widget.dart';
// import 'package:coach_app/Utils/responsive_screen.dart';
// import 'package:coach_app/generated/assets.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sizer/sizer.dart';


// courseAlert({required BuildContext context, String? cid}) {
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (
//       BuildContext context,
//     ) {
//       return AlertDialog(
//         scrollable: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//         actionsPadding: EdgeInsets.zero,
//         backgroundColor: AppColor.whiteColor,
//         content: SizedBox(
//           // width: 40.w,
//           width: 700,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     customText(
//                         /* adminHomeController.select.value == true
//                                 ? "Add Categories"
//                                 : */
//                         "Update Course",
//                         fontWeight: FontWeight.w600,
//                         fontSize: 25,
//                         // !Responsive.isMobile(context) ? 4.sp : 8.sp,
//                         color: AppColor.blueColor),
//                     InkWell(
//                       child: Icon(Icons.close,
//                           color: AppColor.blueColor.withOpacity(0.8)),
//                       onTap: () {
//                         Get.back();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Form(
//                 key: adminHomeController.globalKey,
//                 child: Container(
//                   width: 30.w,
//                   padding: const EdgeInsets.all(25),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: AppColor.blueColor, width: 1)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SizedBox(
//                         width: double.infinity,
//                         child: CustomTextFiled(
//                             maxLines: 1,
//                             validator: (value) {
//                               if (value!.trim().isEmpty) {
//                                 adminHomeController.categoriesController
//                                     .clear();
//                                 return "Course is required";
//                               }
//                               return null;
//                             },
//                             hintText: "Course",
//                             controller:
//                                 adminHomeController.categoriesController),
//                       ),
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       customButton(
//                         height: 50,
//                         width: 350,
//                         text: /* adminHomeController.select.value == true
//                                 ? "Add"
//                                 : */
//                             "Update",
//                         onPressed: () async {
//                           if (adminHomeController.globalKey.currentState!
//                               .validate()) {
//                             /*     if (adminHomeController.select.value == true) {
//                                   // add
//                                   if (adminHomeController
//                                       .categorieList.isNotEmpty) {
//                                     for (int i = 0;
//                                         i <=
//                                             adminHomeController
//                                                 .categorieList.length;
//                                         i++) {
//                                       if (adminHomeController.categorieList[i]
//                                               .toString() ==
//                                           adminHomeController
//                                               .categoriesController.text) {
//                                         // adminHomeController.Addcategories(
//                                         //   categorie: adminHomeController
//                                         //       .categoriesController.text,
//                                         // );
//                                       } else {
//                                         Get.back();
//                                         informationSnackBar(
//                                             context: context,
//                                             message:
//                                                 "Please do not added same categorie name");
//                                       }

//                                       allItem();
//                                     }
//                                   } else {
//                                     // adminHomeController.Addcategories(
//                                     //   categorie: adminHomeController
//                                     //       .categoriesController.text,
//                                     // );
//                                     allItem();
//                                   }
//                                 } else {
//                                   // update
//                                   // adminHomeController.Updatecategories({
//                                   //   "categorie": adminHomeController
//                                   //       .categoriesController.text
//                                   // }, cid!);
//                                   allItem();
//                                   Get.back();
//                                 } */
//                           }
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// coashAlert({required BuildContext context, String? cid}) {
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (
//       BuildContext context,
//     ) {
//       return AlertDialog(
//         scrollable: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//         actionsPadding: EdgeInsets.zero,
//         backgroundColor: AppColor.whiteColor,
//         content: SizedBox(
//           // width: 40.w,
//           width: 700,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     customText(
//                         /* adminHomeController.select.value == true
//                                 ? "Add Categories"
//                                 : */
//                         "View Coach",
//                         fontWeight: FontWeight.w600,
//                         fontSize: 25,
//                         // !Responsive.isMobile(context) ? 4.sp : 8.sp,
//                         color: AppColor.blueColor),
//                     InkWell(
//                       child: Icon(Icons.close,
//                           color: AppColor.blueColor.withOpacity(0.8)),
//                       onTap: () {
//                         Get.back();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Container(
//                 width: 30.w,
//                 padding: const EdgeInsets.all(25),
//                 decoration: BoxDecoration(
//                     color: AppColor.lightblueColor,
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(color: AppColor.blueColor, width: 1)),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Responsive.isMobile(context)
//                             ? Container(
//                                 height: 200,
//                                 width: 200,
//                                 decoration: BoxDecoration(
//                                     color: Colors.amber,
//                                     borderRadius: BorderRadius.circular(10),
//                                     border:
//                                         Border.all(color: AppColor.blueColor),
//                                     // shape: BoxShape.circle,
//                                     image: const DecorationImage(
//                                         image: AssetImage(Assets.assetsProfile),
//                                         fit: BoxFit.fill)),
//                               )
//                             : Container(),
//                         Responsive.isMobile(context)
//                             ? const SizedBox(
//                                 height: 25,
//                               )
//                             : Container(),
//                         richText(
//                             text1: "Name : ",
//                             text2: "Demo",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "Email Id : ",
//                             text2: "demo@gmail.com",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "Gender : ",
//                             text2: "Female",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "City : ",
//                             text2: "Surat",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "State : ",
//                             text2: "Gujrat",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "Country : ",
//                             text2: "India",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "Experience : ",
//                             text2: "2 year",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         richText(
//                             text1: "Ph No. : ",
//                             text2: "+91 9925161204",
//                             fontSize1: 18,
//                             fontSize: 15),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 30,
//                     ),
//                     (Responsive.isDesktop(context))
//                         ? Container(
//                             height: 200,
//                             width: 200,
//                             decoration: BoxDecoration(
//                                 color: Colors.amber,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: AppColor.blueColor),
//                                 // shape: BoxShape.circle,
//                                 image: const DecorationImage(
//                                     image: AssetImage(Assets.assetsProfile),
//                                     fit: BoxFit.fill)),
//                           )
//                         : (Responsive.isTablet(context)
//                             ? Container(
//                                 height: 200,
//                                 width: 200,
//                                 decoration: BoxDecoration(
//                                     color: Colors.amber,
//                                     borderRadius: BorderRadius.circular(10),
//                                     border:
//                                         Border.all(color: AppColor.blueColor),
//                                     // shape: BoxShape.circle,
//                                     image: const DecorationImage(
//                                         image: AssetImage(Assets.assetsProfile),
//                                         fit: BoxFit.fill)),
//                               )
//                             : (!Responsive.isMobile(context)
//                                 ? Container(
//                                     height: 200,
//                                     width: 200,
//                                     decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: Border.all(
//                                             color: AppColor.blueColor),
//                                         // shape: BoxShape.circle,
//                                         image: const DecorationImage(
//                                             image: AssetImage(
//                                                 Assets.assetsProfile),
//                                             fit: BoxFit.fill)),
//                                   )
//                                 : Container())),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// contactusAlert({
//   required BuildContext context,
// }) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (
//         BuildContext context,
//       ) {
//         return AlertDialog(
//           scrollable: true,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//           ),
//           actionsPadding: EdgeInsets.zero,
//           backgroundColor: AppColor.whiteColor,
//           content: SizedBox(
//             width: 40.w,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       customText("Edit Contact Us",
//                           fontWeight: FontWeight.w600,
//                           fontSize: 4.sp,
//                           color: AppColor.blueColor),
//                       InkWell(
//                         child: Icon(Icons.close,
//                             color: AppColor.blueColor.withOpacity(0.8)),
//                         onTap: () {
//                           Get.back();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Form(
//                   key: adminHomeController.globalKey,
//                   child: Container(
//                     // height: 25.h,
//                     width: 30.w,
//                     padding: EdgeInsets.all(5.sp),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.sp),
//                         border:
//                             Border.all(color: AppColor.blueColor, width: 1)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         customText("Sales Number 1", color: AppColor.blueColor),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         SizedBox(
//                           width: 40.w,
//                           child: CustomTextFiled(
//                               maxLines: 1,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "number is required";
//                                 }
//                                 return null;
//                               },
//                               hintText: "Enter sales enquiry no1",
//                               controller: adminHomeController.salno1Controller),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         customText("Sales Number 2", color: AppColor.blueColor),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         SizedBox(
//                           width: 40.w,
//                           child: CustomTextFiled(
//                               maxLines: 1,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "number is required";
//                                 }
//                                 return null;
//                               },
//                               hintText: "Enter sales enquiry no2",
//                               controller: adminHomeController.salno2Controller),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         customText("WhatsApp Number",
//                             color: AppColor.blueColor),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         SizedBox(
//                           width: 40.w,
//                           child: CustomTextFiled(
//                               maxLines: 1,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "number is required";
//                                 }
//                                 return null;
//                               },
//                               hintText: "Enter whatsapp number",
//                               controller:
//                                   adminHomeController.whatsappController),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         customText("Telegram Number",
//                             color: AppColor.blueColor),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         SizedBox(
//                           width: 40.w,
//                           child: CustomTextFiled(
//                               maxLines: 1,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "number is required";
//                                 }
//                                 return null;
//                               },
//                               hintText: "Enter telegram number",
//                               controller:
//                                   adminHomeController.telegramController),
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         customButton(
//                           text: "Save",
//                           height: 50,
//                           width: 350,
//                           onPressed: () {
//                             if (adminHomeController.globalKey.currentState!
//                                 .validate()) {
//                               // adminHomeController.Updatecontactus({
//                               //   'no1':
//                               //       adminHomeController.salno1Controller.text,
//                               //   'no2':
//                               //       adminHomeController.salno2Controller.text,
//                               //   'whatsapp': adminHomeController
//                               //       .whatsappController.text,
//                               //   'telegram': adminHomeController
//                               //       .telegramController.text,
//                               // }, adminHomeController.aboutusList[0].aid);
//                               // ConatctUsdata();
//                             }
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }

// aboutusAlert({
//   required BuildContext context,
// }) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (
//         BuildContext context,
//       ) {
//         return AlertDialog(
//           scrollable: true,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//           ),
//           actionsPadding: EdgeInsets.zero,
//           backgroundColor: AppColor.whiteColor,
//           content: SizedBox(
//             width: 40.w,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       customText("Edit About US",
//                           fontWeight: FontWeight.w600,
//                           fontSize:
//                               !Responsive.isMobile(context) ? 4.sp : 10.sp,
//                           color: AppColor.blueColor),
//                       InkWell(
//                         child: Icon(Icons.close,
//                             color: AppColor.blueColor.withOpacity(0.8)),
//                         onTap: () {
//                           Get.back();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Form(
//                   key: adminHomeController.globalKey,
//                   child: Container(
//                     // height: 25.h,
//                     width: 30.w,
//                     padding: EdgeInsets.all(5.sp),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.sp),
//                         border:
//                             Border.all(color: AppColor.blueColor, width: 1)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           width: 40.w,
//                           child: CustomTextFiled(
//                               maxLines: 10,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Aboutus is required";
//                                 }
//                                 return null;
//                               },
//                               hintText: "About us",
//                               controller:
//                                   adminHomeController.aboutusController),
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         customButton(
//                           height: 50,
//                           width: 350,
//                           text: "Save",
//                           onPressed: () {
//                             if (adminHomeController.globalKey.currentState!
//                                 .validate()) {
//                               // adminHomeController.Updateaboutus({
//                               //   'text':
//                               //       adminHomeController.aboutusController.text
//                               // }, adminHomeController.aboutusList[0].aid);
//                               // AboutUsdata();
//                             }
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }

// termsofuseAlert({
//   required BuildContext context,
// }) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (
//         BuildContext context,
//       ) {
//         return AlertDialog(
//           scrollable: true,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//           ),
//           actionsPadding: EdgeInsets.zero,
//           backgroundColor: AppColor.whiteColor,
//           content: SizedBox(
//             width: 40.w,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       customText("Edit terms of use",
//                           fontWeight: FontWeight.w600,
//                           fontSize:
//                               !Responsive.isMobile(context) ? 4.sp : 10.sp,
//                           color: AppColor.blueColor),
//                       InkWell(
//                         child: Icon(Icons.close,
//                             color: AppColor.blueColor.withOpacity(0.8)),
//                         onTap: () {
//                           Get.back();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Form(
//                   key: adminHomeController.globalKey,
//                   child: Container(
//                     // height: 25.h,
//                     width: 30.w,
//                     padding: EdgeInsets.all(5.sp),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.sp),
//                         border:
//                             Border.all(color: AppColor.blueColor, width: 1)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                           width: 40.w,
//                           child: CustomTextFiled(
//                               maxLines: 10,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "terms is required";
//                                 }
//                                 return null;
//                               },
//                               hintText: "Terms of use",
//                               controller:
//                                   adminHomeController.aboutusController),
//                         ),
//                         SizedBox(
//                           height: 3.h,
//                         ),
//                         customButton(
//                           height: 50,
//                           width: 350,
//                           text: "Save",
//                           onPressed: () {
//                             if (adminHomeController.globalKey.currentState!
//                                 .validate()) {
//                               // adminHomeController.Updateaboutus({
//                               //   'text':
//                               //       adminHomeController.aboutusController.text
//                               // }, adminHomeController.aboutusList[0].aid);
//                               // AboutUsdata();
//                             }
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }

// class imageAlert extends StatefulWidget {
//   // String? pid;
//   // String? selectedValue1;
//   // String? image1;
//   // dynamic productdata;
//   const imageAlert({
//     super.key,
//     // this.pid,
//     // this.selectedValue1,
//     // this.image1,
//     // this.productdata
//   });

//   @override
//   State<imageAlert> createState() => _imageAlertState();
// }

// class _imageAlertState extends State<imageAlert> {
//   String selectedValue = "";
//   File? _pickedImage;
//   var imagename;
//   Uint8List webImage = Uint8List(8);
//   String downloadUrl = "";
//   XFile? image;

//   @override
//   void initState() {
//     super.initState();
//     // widget.productdata;
//   }

//   Future<void> _pickImage() async {
//     if (!kIsWeb) {
//       final ImagePicker picker = ImagePicker();
//       image = await picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         var Selected = File(image!.path);
//         setState(() {
//           _pickedImage = Selected;
//         });
//       } else {
//         log("No Image has been picked...");
//       }
//     } else if (kIsWeb) {
//       setState(() {});
//       final ImagePicker picker = ImagePicker();
//       image = await picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         var f = await image!.readAsBytes();
//         setState(() {
//           webImage = f;
//           _pickedImage = File('a');
//         });
//       } else {
//         log("No Image has been picked...");
//       }
//     } else {
//       log("Something want wrong");
//     }
//   }

//   // Future<String> uploadImage(Uint8List xfile) async {
//   //   showProgressIndicator();
//   //   downloadUrl = "";
//   //   Reference ref = FirebaseStorage.instance.ref().child('Product');
//   //   String id = const Uuid().v1();
//   //   ref = ref.child(id);

//   //   UploadTask uploadTask = ref.putData(
//   //     xfile,
//   //     SettableMetadata(contentType: 'image/jpg'),
//   //     // SettableMetadata(contentType: ),
//   //   );
//   //   TaskSnapshot snapshot = await uploadTask;
//   //   downloadUrl = await snapshot.ref.getDownloadURL();

//   //   print("image >>>>>>>>>>>>>>>> ${downloadUrl}");
//   //   dismissProgressIndicator();
//   //   return downloadUrl;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         scrollable: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//         actionsPadding: EdgeInsets.zero,
//         backgroundColor: AppColor.whiteColor,
//         content: StatefulBuilder(
//           builder: (context, setState) {
//             return SizedBox(
//               width: 40.w,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         customText("Add Image",
//                             fontWeight: FontWeight.w600,
//                             fontSize:
//                                 !Responsive.isMobile(context) ? 4.sp : 10.sp,
//                             color: AppColor.blueColor),
//                         InkWell(
//                           child: Icon(Icons.close,
//                               color: AppColor.blueColor.withOpacity(0.8)),
//                           onTap: () {
//                             Get.back();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                   Form(
//                     key: adminHomeController.globalKey,
//                     child: Container(
//                       // height: 25.h,
//                       width: 30.w,
//                       padding: const EdgeInsets.all(25),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border:
//                               Border.all(color: AppColor.blueColor, width: 1)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _pickImage();
//                                 });
//                               },
//                               child: Container(
//                                 width: 40.w,
//                                 height: 25.h,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: AppColor.blueColor),
//                                   color: AppColor.lightfillColor,
//                                   borderRadius: BorderRadius.circular(4.sp),
//                                 ),
//                                 child: image != null
//                                     ? Container(
//                                         width: 40.w,
//                                         height: 25.h,
//                                         decoration: BoxDecoration(
//                                           color: AppColor.blueColor,
//                                           borderRadius:
//                                               BorderRadius.circular(4.sp),
//                                           image: DecorationImage(
//                                             image: MemoryImage(webImage),
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                       )
//                                     : const Icon(
//                                         Icons.add,
//                                         color: AppColor.blueColor,
//                                         size: 35,
//                                       ),
//                               )),
//                           SizedBox(
//                             height: 3.h,
//                           ),
//                           customButton(
//                             text: "Save",
//                             height: 50,
//                             width: 350,
//                             onPressed: () async {
//                               /*     if (adminHomeController.globalKey.currentState!
//                                   .validate()) {
//                                 if (adminHomeController.select.value == true) {
//                                   // add

//                                   if (webImage != null) {
//                                     uploadImage(webImage);
//                                     Timer(
//                                       Duration(seconds: 7),
//                                       () {
//                                         if (downloadUrl != '') {
//                                           adminHomeController.AddProduct(
//                                             pname: adminHomeController
//                                                 .pnameController.text,
//                                             categorie: selectedValue,
//                                             description: adminHomeController
//                                                 .pdescriptionController.text,
//                                             image: downloadUrl == ''
//                                                 ? ""
//                                                 : downloadUrl,
//                                             price: adminHomeController
//                                                 .priceController.text,
//                                             quantity: adminHomeController
//                                                 .puantityController.text,
//                                           );
//                                           log("Add Product.........");
//                                           widget.productdata;
//                                           log("Add Product____________");

                                          
//                                         } else {
//                                           errorSnackBar(
//                                               message:
//                                                   "Don not add Product. Please try again");
//                                           adminHomeController.pnameController
//                                               .clear();
//                                           adminHomeController.priceController
//                                               .clear();
//                                           adminHomeController.puantityController
//                                               .clear();
//                                           adminHomeController
//                                               .pdescriptionController
//                                               .clear();
//                                         }
//                                         Get.back();
//                                       },
//                                     );

//                                     // ProductData();
//                                   }
//                                 } else {
//                                   // update
//                                   if (_pickedImage == null) {
//                                     showProgressIndicator();
//                                     downloadUrl = widget.image1!;
//                                     Timer(
//                                       Duration(seconds: 10),
//                                       () {
//                                         // adminHomeController.Updateproduct(
//                                         //   {
//                                         //     "p_name": adminHomeController
//                                         //         .pnameController.text,
//                                         //     "categorie": selectedValue == ""
//                                         //         ? widget.selectedValue1
//                                         //         : selectedValue,
//                                         //     "price": adminHomeController
//                                         //         .priceController.text,
//                                         //     "quantity": adminHomeController
//                                         //         .puantityController.text,
//                                         //     "description": adminHomeController
//                                         //         .pdescriptionController.text,
//                                         //     "image": downloadUrl,
//                                         //   },
//                                         //   widget.pid.toString(),
//                                         // );
//                                       },
//                                     );
//                                     widget.productdata;
//                                     dismissProgressIndicator();
                                   
//                                   } else {
//                                     uploadImage(webImage);
//                                     Timer(
//                                       Duration(seconds: 7),
//                                       () {
//                                         // if (downloadUrl != '') {
//                                         //   adminHomeController.Updateproduct({
//                                         //     "p_name": adminHomeController
//                                         //         .pnameController.text,
//                                         //     "categorie": selectedValue == ""
//                                         //         ? widget.selectedValue1
//                                         //         : selectedValue,
//                                         //     "price": adminHomeController
//                                         //         .priceController.text,
//                                         //     "quantity": adminHomeController
//                                         //         .puantityController.text,
//                                         //     "description": adminHomeController
//                                         //         .pdescriptionController.text,
//                                         //     "image": downloadUrl,
//                                         //   }, widget.pid.toString());
//                                         //   widget.productdata;
//                                         // } else {
//                                         //   errorSnackBar(
//                                         //       message:
//                                         //           "Don not Update Product. Please try again");
//                                         // }
                                       
//                                       },
//                                     );
//                                   }

//                                   selectedValue = "";
//                                   // ProductData();
//                                 }
//                               } */
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ));
//   }
// }

// deleteAlert({
//   required BuildContext context,
//   required void Function() onPressed,
// }) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (
//         BuildContext context,
//       ) {
//         return AlertDialog(
//           scrollable: true,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//           ),
//           actionsPadding: EdgeInsets.zero,
//           backgroundColor: AppColor.whiteColor,
//           content: SizedBox(
//             width: 40.w,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   // height: 25.h,
//                   width: 30.w,
//                   padding: EdgeInsets.all(5.sp),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.sp),
//                       border: Border.all(color: AppColor.blueColor, width: 1)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Image.asset(
//                         Assets.assetsInformation,
//                         scale: 4,
//                         color: AppColor.blueColor,
//                       ),
//                       SizedBox(
//                         height: 3.h,
//                       ),
//                       customText(
//                         "Are you sure you want to delete?",
//                         textAlign: TextAlign.center,
//                         softWrap: true,
//                         fontSize: 20,
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           customOutlineButton(
//                             onPressed: onPressed,
//                             text: "Yes, delete it!",
//                             fontSize: Responsive.isMobile(context) ? 11 : 15,
//                             height: Responsive.isMobile(context) ? 30 : 50,
//                             width: Responsive.isMobile(context) ? 100 : 15.w,
//                           ),
//                           SizedBox(
//                             width: 1.w,
//                           ),
//                           customButton(
//                             fontSize: Responsive.isMobile(context) ? 11 : 15,
//                             height: Responsive.isMobile(context) ? 30 : 50,
//                             width: Responsive.isMobile(context) ? 100 : 15.w,
//                             text: "Cancel",
//                             onPressed: () {
//                             Get.back();
//                             },
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
