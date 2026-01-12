// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:coach_app/Data/Api/post_api_manager.dart';
import 'package:coach_app/Data/Model/current_user_response_model.dart';
import 'package:coach_app/Data/Model/upload_image_response_model.dart';
import 'package:coach_app/Data/Model/video_add_response_model.dart';
import 'package:coach_app/Repository/authentication_repository.dart';
import 'package:coach_app/Repository/coures_repository.dart';
import 'package:coach_app/Repository/dashboard_repository.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Data/Api/api_manager.dart';

class MenuBarController extends GetxController {
  final authenticationRepository =
      AuthenticationRepository(APIManager(), PostAPIManager());
  final dashboardRepository =
      DashboardRepository(APIManager(), PostAPIManager());
  final couresRepository = CouresRepository(APIManager(), PostAPIManager());

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phnoController = TextEditingController();
  TextEditingController watshappnoController = TextEditingController();
  TextEditingController telegramController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController Controller = TextEditingController();

  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController conController = TextEditingController();

  Rx<CurrentUserResponseModel> currentUserDetails =
      CurrentUserResponseModel().obs;
  Rx<VideoAddResponsemodel> editProfileDetails = VideoAddResponsemodel().obs;
  Rx<UploadImageResponseModel> uploadImageDetails =
      UploadImageResponseModel().obs;
  Rx<CurrentUserdata> userDataList = CurrentUserdata().obs;

  RxString gender = "".obs;
  Rx<String> bannerImageName = "".obs;
  Uint8List bytesImage = Uint8List(8);
  bool selected = true;
  var UrlDownload;
  ImagePicker imagePicker = ImagePicker();
  // late Rx imageShow;
  var imageShow;
  var imagename;
  // Rx imagepath = "".obs;

/*   void permissionCamera(BuildContext context) async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus == PermissionStatus.granted) {
      openCamera();
    }
    if (cameraStatus == PermissionStatus.denied) {
      Get.snackbar("Please access camera",
          "Camera needs to access your microphone, Please provide permission");
    } else if (cameraStatus == PermissionStatus.permanentlyDenied) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Allow app to access your Camera ?'),
          content: const Text(
              'You need to allow camera access in parameters for use your camera in the app'),
          actions: <Widget>[
            // if user deny again, we do nothing
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Don\'t allow'),
            ),
            // if user is agree, you can redirect him to the app parameters :)
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.pop(context);
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      );
    }
  }

  void permissionStorage(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      openGallery();
    }
    if (status == PermissionStatus.denied) {


          informationSnackBar(title: "Please access gallery",message: "Gallery needs to access your microphone, Please provide permission");
    } else if (status == PermissionStatus.permanentlyDenied) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Allow app to access your Gallery ?'),
          content: const Text(
              'You need to allow gallery access in parameters for use your gallery in the app'),
          actions: <Widget>[
            // if user deny again, we do nothing
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Don\'t allow'),
            ),

            // if user is agree, you can redirect him to the app parameters :)
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.pop(context);
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      );
    }
  }

  void permissionPhotos(BuildContext context) async {
    PermissionStatus galleryStatus = await Permission.photos.request();
    if (galleryStatus == PermissionStatus.granted) {
      openGallery();
    }
    if (galleryStatus == PermissionStatus.denied) {
      Get.snackbar("Please access gallery",
          "Gallery needs to access your microphone, Please provide permission");
    } else if (galleryStatus == PermissionStatus.permanentlyDenied) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Allow app to access your Gallery ?'),
          content: const Text(
              'You need to allow gallery access in parameters for use your gallery in the app'),
          actions: <Widget>[
            // if user deny again, we do nothing
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Don\'t allow'),
            ),

            // if user is agree, you can redirect him to the app parameters :)
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.pop(context);
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      );
    }
  }
 */
  Future<void> openCamera() async {
    final XFile? camera =
        await imagePicker.pickImage(source: ImageSource.camera);

    imageShow = File(camera!.path);
    imagename = File(camera.name);
    // imagepath.value = imageShow;
    log("imahe url ::: $imageShow ");
    update();
  }

  var currentImage;

  // Future<void> openGallery() async {
  //   final XFile? gallery =
  //       await imagePicker.pickImage(source: ImageSource.gallery);

  //   imageShow = File(gallery!.path);
  //   imagename = File(gallery.name);
  //   var f = await gallery.readAsBytes();
  //   bannerImageName.value = gallery.name;
  //   bytesImage = f;
  //   // imagepath.value = imageShow;
  //   log("imahe url ::: $imageShow ");
  //   update();
  // }

  Future<void> openGallery(ImageSource source) async {
    final XFile? gallery = await imagePicker.pickImage(source: source);

    imageShow = File(gallery!.path);
    imagename = File(gallery.name);
    var f = await gallery.readAsBytes();
    bannerImageName.value = gallery.name;
    bytesImage = f;
    // imagepath.value = imageShow;
    log("imahe url ::: $imageShow ");
    update();
  }

  currentUser({
    required BuildContext context,
  }) async {
    currentUserDetails.value =
        await authenticationRepository.currentUserApiCall();

    // success message & navigation

    if (currentUserDetails.value.status == true) {
      userDataList.value = currentUserDetails.value.userdata!;
      usernameController.text =
          userDataList.value.username.toString();
      emailController.text =
          userDataList.value.email.toString();
      phnoController.text =
          userDataList.value.mobile.toString();
      telegramController.text =
          userDataList.value.telegramno.toString();
      watshappnoController.text =
          userDataList.value.whatsapp.toString();
      expController.text =
          userDataList.value.experience.toString();
      countryController.text =
          userDataList.value.country.toString();
      cityController.text = userDataList.value.city.toString();
      currentImage = userDataList.value.image.toString();
      gender.value = currentUserDetails.value.userdata!.gender.toString();
    } else {
      errorSnackBar(message: currentUserDetails.value.message);
    }

    update();
  }

  void permissionCamera() async {
    Get.dialog(AlertDialog(
      title: const Text('Allow app to access your Camera ?'),
      content: const Text(
          'You need to allow camera access in parameters for use your camera in the app'),
      actions: <Widget>[
        // if user deny again, we do nothing
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Don\'t allow'),
        ),
        // if user is agree, you can redirect him to the app parameters :)
        TextButton(
          onPressed: () {
            openAppSettings();
            Get.back();
          },
          child: const Text('Allow'),
        ),
      ],
    ));
  }

  void permissionGallery() async {
    Get.dialog(AlertDialog(
      title: const Text('Allow app to access your Gallery ?'),
      content: const Text(
          'You need to allow gallery access in parameters for use your photos in the app'),
      actions: <Widget>[
        // if user deny again, we do nothing
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Don\'t allow'),
        ),
        TextButton(
          onPressed: () {
            openAppSettings();
            Get.back();
          },
          child: const Text('Allow'),
        ),
      ],
    ));
  }

  void permissionStorage(context) async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      /// code
    }
    if (status == PermissionStatus.denied) {
      Get.snackbar("Please access gallery",
          "Gallery needs to access your microphone, Please provide permission");
    } else if (status == PermissionStatus.permanentlyDenied) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Allow app to access your Gallery ?'),
          content: const Text(
              'You need to allow gallery access in parameters for use your gallery in the app'),
          actions: <Widget>[
            // if user deny again, we do nothing
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Don\'t allow'),
            ),

            // if user is agree, you can redirect him to the app parameters :)
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.pop(context);
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      );
    }
  }

  void permissionPhotos(context) async {
    PermissionStatus galleryStatus = await Permission.photos.request();
    if (galleryStatus == PermissionStatus.granted) {
      openGallery(ImageSource.gallery);
    }
    if (galleryStatus == PermissionStatus.denied) {
      Get.snackbar("Please access gallery",
          "Gallery needs to access your microphone, Please provide permission");
    } else if (galleryStatus == PermissionStatus.permanentlyDenied) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Allow app to access your Gallery ?'),
          content: const Text(
              'You need to allow gallery access in parameters for use your gallery in the app'),
          actions: <Widget>[
            // if user deny again, we do nothing
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Don\'t allow'),
            ),

            // if user is agree, you can redirect him to the app parameters :)
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.pop(context);
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      );
    }
  }

  showAlertDialog(context, String text) => showCupertinoDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Permission Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      );

  void pickProfilePhoto(BuildContext context, ImageSource source) async {
    if (Platform.isAndroid) {
      log('sdzfsdf');
      if (source == ImageSource.camera) {
        PermissionStatus status = await Permission.camera.request();
        if (status.isPermanentlyDenied) {
          permissionCamera();
          return;
        }
        if (status.isDenied) {
          return;
        }
      }
      if (source == ImageSource.gallery) {
        PermissionStatus status = await Permission.photos.request();
        if (status.isPermanentlyDenied) {
          permissionGallery();
          return;
        }
        if (status.isDenied) {
          return;
        }
      }
    }
    try {
      // final picker = ImagePicker();
      // XFile? file = await picker.pickImage(source: source);
      // if (file == null) return;
      // imageShow.value = file.path;
      // log('Profile Image path:--- ${imageShow.value}');
      openGallery(source);
    } catch (e) {
      if (Platform.isIOS && source == ImageSource.gallery) {
        var status = await Permission.photos.status;
        if (status.isDenied || status.isPermanentlyDenied) {
          print('Access Denied');
          showAlertDialog(context, 'Allow access to gallery and photos');
        } else {
          print('Exception occured!');
        }
      } else if (Platform.isIOS && source == ImageSource.camera) {
        var status = await Permission.camera.status;
        if (status.isDenied || status.isPermanentlyDenied) {
          print('Access Denied');
          showAlertDialog(context, 'Allow access to camera');
        } else {
          print('Exception occured!');
        }
      }
    }
  }

  editProfileData({
    required BuildContext context,
    required id,
    required image,
  }) async {
    editProfileDetails.value = await dashboardRepository.editProfileAPICall(
      cid: id,
      city: cityController.text,
      country: countryController.text,
      email: emailController.text,
      experience: expController.text,
      gender: gender.value.toString(),
      image: image,
      mobile: phnoController.text,
      telegramno: telegramController.text,
      username: usernameController.text,
      whatsapp: watshappnoController.text,
    );

    // success message & navigation

    if (editProfileDetails.value.status == true) {
      currentUser(context: context);
      Get.back();
      // categoryData(categoryId: categoryId, context: context);

      successSnackBar(message: editProfileDetails.value.message);
    } else {
      errorSnackBar(message: editProfileDetails.value.message);
    }

    update();
  }

  profileUploadImage(BuildContext context,
      {var id, couresId, bool picimage = false, var image, var name}) async {
    if (picimage == true) {
      uploadImageDetails.value = await couresRepository.uploadImageApiCall(
        imageName: name,
        image: image,
      );

      if (uploadImageDetails.value.status == true) {
        editProfileData(
            context: context, id: id, image: uploadImageDetails.value.image);
      } else {
        errorSnackBar(
          message: uploadImageDetails.value.message,
        );
      }
    } else {
      editProfileData(context: context, id: id, image: image);
    }
  }
}
