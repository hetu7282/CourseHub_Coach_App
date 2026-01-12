// ignore_for_file: use_build_context_synchronously

import 'package:coach_app/Data/Api/api_manager.dart';
import 'package:coach_app/Data/Api/post_api_manager.dart';
import 'package:coach_app/Data/Model/coures_add_response_model.dart';
import 'package:coach_app/Data/Model/coures_response_model.dart';
import 'package:coach_app/Data/Model/get_buy_user_response_model.dart';
import 'package:coach_app/Data/Model/get_video_response_model.dart';
import 'package:coach_app/Data/Model/upload_image_response_model.dart';
import 'package:coach_app/Data/Model/video_add_response_model.dart';
import 'package:coach_app/Repository/coures_repository.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouresController extends GetxController {
  final couresRepository = CouresRepository(APIManager(), PostAPIManager());
  TextEditingController searchController = TextEditingController();

  TextEditingController titleController = TextEditingController();
// TextEditingController subtitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController feeController = TextEditingController();

  TextEditingController videotiltleController = TextEditingController();
  TextEditingController videosubtiltleController = TextEditingController();
  TextEditingController videolinkController = TextEditingController();

  RxInt selcteCategoryValue = 0.obs;

  RxString currentBannerImage = "".obs;
  RxInt currentCouresId = 0.obs;

  Rx<UploadImageResponseModel> uploadImageDetails =
      UploadImageResponseModel().obs;
  Rx<GetVideoResponseModel> videoDetails = GetVideoResponseModel().obs;
  Rx<GetBuyUserResponseModel> buyUserDetails = GetBuyUserResponseModel().obs;
  Rx<VideoAddResponsemodel> addVideoDetails = VideoAddResponsemodel().obs;
  Rx<CouresResponseModel> couresDetails = CouresResponseModel().obs;
  Rx<CouresAddResponseModel> couresAddDetails = CouresAddResponseModel().obs;
  Rx<VideoAddResponsemodel> enableCouresDetails = VideoAddResponsemodel().obs;

  RxList<Coursedata> couresList = <Coursedata>[].obs;
  RxList<VideoData> videoList = <VideoData>[].obs;
  RxList<Paymentdata> buyCourseList = <Paymentdata>[].obs;

  Rx<ValueNotifier<bool>> switchcontroller = ValueNotifier<bool>(false).obs;

  RxBool initSwitchValue = false.obs;

  clearVideoData() {
    videotiltleController.clear();
    videosubtiltleController.clear();
    videolinkController.clear();
  }

  clearCouresData() {
    titleController.clear();
    descriptionController.clear();
    feeController.clear();

    currentBannerImage.value = "";
    selcteCategoryValue.value = 0;
  }

  //********************** Add Video **********************//

  buyUserData({
    required BuildContext context,
  }) async {
    buyUserDetails.value = await couresRepository.getBuyUserDataAPICall();

    // success message & navigation

    if (buyUserDetails.value.status == true) {
      buyCourseList.clear();
      // Get.toNamed(Routes.TERMS_OF_USE_SCREEN);
      buyCourseList.addAll(buyUserDetails.value.paymentdata!.toList());
    } else {
      errorSnackBar(message: addVideoDetails.value.message);
      buyCourseList.clear();
    }

    update();
  }
  //********************** Add Video **********************//

  addVideoData({
    required BuildContext context,
    required courseId,
  }) async {
    addVideoDetails.value = await couresRepository.addVideoDataAPICall(
      courseId: courseId,
      videoLink: videolinkController.text,
      videoSubtitle: videosubtiltleController.text,
      videoTitle: videotiltleController.text,
    );

    // success message & navigation

    if (addVideoDetails.value.status == true) {
      videoData(context: context, courseId: courseId);
      Get.back();
      successSnackBar(message: addVideoDetails.value.message);

      // clearVideoData();
    } else {
      errorSnackBar(message: addVideoDetails.value.message);
      clearVideoData();
    }

    update();
  }

  //********************** update Video **********************//

  updateVideoData({
    required BuildContext context,
    required courseId,
    required videoId,
  }) async {
    addVideoDetails.value = await couresRepository.editVideoDataAPICall(
      courseId: courseId,
      videoLink: videolinkController.text,
      videoSubtitle: videosubtiltleController.text,
      videoTitle: videotiltleController.text,
      videoId: videoId,
    );

    // success message & navigation

    if (addVideoDetails.value.status == true) {
      videoData(context: context, courseId: courseId);
      Get.back();
      successSnackBar(message: addVideoDetails.value.message);
    } else {
      errorSnackBar(message: addVideoDetails.value.message);
    }

    update();
  }

  enableVideoUpdateData({
    required BuildContext context,
    required videoId,
    required courseId,
    required enable,
  }) async {
    enableCouresDetails.value = await couresRepository.updateEnableVideoAPICall(
      videoId: videoId,
      courseId: courseId,
      enable: enable,
    );

    // success message & navigation

    if (enableCouresDetails.value.status == true) {
      successSnackBar(message: enableCouresDetails.value.message);
    } else {
      errorSnackBar(message: enableCouresDetails.value.message);
    }

    update();
  }

  //********************** Delete Video **********************//

  deleteVideoData({
    required BuildContext context,
    required courseId,
    required videoId,
  }) async {
    addVideoDetails.value = await couresRepository.deleteVideoDataAPICall(
      videoId: videoId,
      courseId: courseId,
    );

    // success message & navigation

    if (addVideoDetails.value.status == true) {
      videoData(context: context, courseId: courseId);
      successSnackBar(message: addVideoDetails.value.message);
    } else {
      errorSnackBar(message: addVideoDetails.value.message);
    }

    update();
  }

  //********************** Get Video **********************//

  videoData({
    required BuildContext context,
    required courseId,
  }) async {
    videoDetails.value =
        await couresRepository.getVideoDataAPICall(courseId: courseId);

    // success message & navigation

    if (videoDetails.value.status == true) {
      videoList.clear();
      // Get.toNamed(Routes.TERMS_OF_USE_SCREEN);
      videoList.addAll(videoDetails.value.data!.toList());
    } else {
      // errorSnackBar(message: couresDetails.value.message);
      videoList.clear();
    }

    update();
  }

  //********************** Category Wise Coures Data **********************//

  categoryData({
    required BuildContext context,
    required categoryId,
  }) async {
    couresDetails.value =
        await couresRepository.couresDataAPICall(categoryId: categoryId);

    // success message & navigation

    if (couresDetails.value.status == true) {
      couresList.clear();
      // Get.toNamed(Routes.TERMS_OF_USE_SCREEN);
      couresList.addAll(couresDetails.value.coursedata!.toList());
    } else {
      // errorSnackBar(message: couresDetails.value.message);
      couresList.clear();
    }

    update();
  }
  //**********************  Coures Delete Data **********************//

  couresDeleteData({
    required BuildContext context,
    required categoryId,
    required coureseId,
  }) async {
    couresAddDetails.value =
        await couresRepository.couresDeleteDataAPICall(coureseId: coureseId);

    // success message & navigation

    if (couresAddDetails.value.status == true) {
      Get.back();
      Get.back();
      categoryData(context: context, categoryId: categoryId);
      successSnackBar(message: couresAddDetails.value.message);
    } else {
      errorSnackBar(message: couresAddDetails.value.message);
    }
    update();
  }

  //********************** Coures Add **********************//

  couresAddData({
    required BuildContext context,
    required categoryId,
    required bannerimage,
  }) async {
    couresAddDetails.value = await couresRepository.couresAddDataAPICall(
      categoryId: categoryId,
      bannerimage: bannerimage,
      coursedes: descriptionController.text,
      coursename: titleController.text,
      price: int.parse(feeController.text),
    );

    // success message & navigation

    if (couresAddDetails.value.status == true) {
      Get.back();
      categoryData(categoryId: categoryId, context: context);
      successSnackBar(message: couresAddDetails.value.message);
    } else {
      errorSnackBar(message: couresAddDetails.value.message);
    }

    update();
  }

  couresAddUploadImage(BuildContext context, var image, String name,
      {var id, couresId}) async {
    uploadImageDetails.value = await couresRepository.uploadImageApiCall(
      imageName: name,
      image: image,
    );

    if (uploadImageDetails.value.status == true) {
      couresAddData(
          context: context,
          categoryId: id,
          bannerimage: uploadImageDetails.value.image.toString());
    } else {
      errorSnackBar(
        message: uploadImageDetails.value.message,
      );
    }
  }

  //********************** Coures Update **********************//

  couresUpdateData({
    required BuildContext context,
    required categoryId,
    required couresId,
    required bannerimage,
  }) async {
    couresAddDetails.value = await couresRepository.couresUpdateDataAPICall(
      couresId: couresId,
      categoryId: categoryId,
      bannerimage: bannerimage,
      coursedes: descriptionController.text,
      coursename: titleController.text,
      price: int.parse(feeController.text),
    );

    // success message & navigation

    if (couresAddDetails.value.status == true) {
      Get.back();
      Get.back();
      categoryData(categoryId: categoryId, context: context);
      successSnackBar(message: couresAddDetails.value.message);
    } else {
      errorSnackBar(message: couresAddDetails.value.message);
    }

    update();
  }

  couresUpdateUploadImage(BuildContext context, var image, String name,
      {var id, couresId}) async {
    uploadImageDetails.value = await couresRepository.uploadImageApiCall(
      imageName: name,
      image: image,
    );

    if (uploadImageDetails.value.status == true) {
      couresUpdateData(
          couresId: couresId,
          context: context,
          categoryId: id,
          bannerimage: uploadImageDetails.value.image.toString());
    } else {
      errorSnackBar(
        message: uploadImageDetails.value.message,
      );
    }
  }

  enableCouresUpdateData({
    required BuildContext context,
    required courseId,
    required enable,
  }) async {
    enableCouresDetails.value =
        await couresRepository.updateEnableCourseAPICall(
      courseId: courseId,
      enable: enable,
    );

    // success message & navigation

    if (enableCouresDetails.value.status == true) {
      successSnackBar(message: enableCouresDetails.value.message);
    } else {
      errorSnackBar(message: enableCouresDetails.value.message);
    }

    update();
  }
}
