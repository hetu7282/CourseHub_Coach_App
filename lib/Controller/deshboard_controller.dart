import 'package:carousel_slider/carousel_controller.dart';
import 'package:coach_app/Data/Api/api_manager.dart';
import 'package:coach_app/Data/Api/post_api_manager.dart';
import 'package:coach_app/Data/Model/aboutus_response_model.dart';
import 'package:coach_app/Data/Model/category_response_model.dart';
import 'package:coach_app/Data/Model/chnage_password_model.dart';
import 'package:coach_app/Data/Model/contactus_response_model.dart';
import 'package:coach_app/Data/Model/slider_image_response_model.dart';
import 'package:coach_app/Data/Model/terms_of_use_response_model.dart';

import 'package:coach_app/Repository/authentication_repository.dart';
import 'package:coach_app/Repository/dashboard_repository.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Screen/Desboard/home_screen.dart';
import 'package:coach_app/Screen/Desboard/student_screen.dart';
import 'package:coach_app/Screen/Desboard/menu_screen.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final authenticationRepository =
      AuthenticationRepository(APIManager(), PostAPIManager());
  final dashboardpository = DashboardRepository(APIManager(), PostAPIManager());
  RxInt currentSelected = 0.obs;
  List<Widget> screenWidgets = <Widget>[
    const HomeScreen(),
    const StudenScreen(),
    const MenuScreen(),
  ];

  final CarouselController imagesildercontroller = CarouselController();
  TabController? tabController;
  RxInt currentIndex = 0.obs;
  List tablist = ['Flutter', "Ios", "NodeJs", "ReactJs", "Android"];

  Rx<AboutUsResponseModel> aboutUsDetails = AboutUsResponseModel().obs;
  Rx<ContactUsResponseModel> contactUsDetails = ContactUsResponseModel().obs;
  Rx<TermsOfUseResponseModel> termsOfUseDetails = TermsOfUseResponseModel().obs;
  Rx<ChangePasswordResponseModel> changePasswordDetails =
      ChangePasswordResponseModel().obs;
  Rx<SliderImageResponseModel> sliderImageDetails =
      SliderImageResponseModel().obs;
  Rx<CategoryResponseModel> categoryDetails = CategoryResponseModel().obs;

  RxList<ImageData> sliderImageList = <ImageData>[].obs;
  RxList<CategoryData> categoryList = <CategoryData>[].obs;

  //********************** About Us **********************//

  aboutUs({
    required BuildContext context,
  }) async {
    aboutUsDetails.value = await dashboardpository.aboutusDataAPICall();

    // success message & navigation

    if (aboutUsDetails.value.status == true) {
      Get.toNamed(Routes.ABOUT_US_SCREEN);
    } else {
      errorSnackBar(message: aboutUsDetails.value.message);
    }

    update();
  }

  //********************** Contact Us **********************//

  contactUs({
    required BuildContext context,
  }) async {
    contactUsDetails.value = await dashboardpository.contactusDataAPICall();

    // success message & navigation

    if (contactUsDetails.value.status == true) {
      Get.toNamed(Routes.CONTACT_US_SCREEN);
    } else {
      errorSnackBar(message: contactUsDetails.value.message);
    }

    update();
  }
  //********************** Terms Of Use **********************//

  termsOfUse({
    required BuildContext context,
  }) async {
    termsOfUseDetails.value = await dashboardpository.termsOfUseDataAPICall();

    // success message & navigation

    if (termsOfUseDetails.value.status == true) {
      Get.toNamed(Routes.TERMS_OF_USE_SCREEN);
    } else {
      errorSnackBar(message: termsOfUseDetails.value.message);
    }

    update();
  }

  //********************** Slider Image **********************//

  sliderImage({
    required BuildContext context,
  }) async {
    sliderImageDetails.value = await dashboardpository.bannerImageDataAPICall();

    // success message & navigation

    if (sliderImageDetails.value.status == true) {
      // Get.toNamed(Routes.TERMS_OF_USE_SCREEN);
      sliderImageList.addAll(sliderImageDetails.value.data!.toList());
    } else {
      errorSnackBar(message: sliderImageDetails.value.message);
    }

    update();
  }

  //********************** Slider Image **********************//

  categoryData({
    required BuildContext context,
  }) async {
    categoryDetails.value = await dashboardpository.categoryDataAPICall();

    // success message & navigation

    if (categoryDetails.value.status == true) {
      // Get.toNamed(Routes.TERMS_OF_USE_SCREEN);
      categoryList.addAll(categoryDetails.value.data!.toList());
    } else {
      errorSnackBar(message: categoryDetails.value.message);
    }

    update();
  }

  //********************** Terms Of Use **********************//

  chnagePassword({
    required BuildContext context,
    required String password,
  }) async {
    changePasswordDetails.value =
        await dashboardpository.chnagePasswordAPICall(password: password);

    // success message & navigation

    if (changePasswordDetails.value.status == true) {
      Get.back();
      successSnackBar(message: changePasswordDetails.value.message);
    } else {
      errorSnackBar(message: changePasswordDetails.value.message);
    }

    update();
  }




}
