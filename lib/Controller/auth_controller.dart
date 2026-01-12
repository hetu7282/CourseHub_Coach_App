import 'package:coach_app/Data/Api/post_api_manager.dart';
import 'package:coach_app/Data/Model/login_response_model.dart';
import 'package:coach_app/Data/Model/current_user_response_model.dart';
import 'package:coach_app/Repository/authentication_repository.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Data/Api/api_manager.dart';
import '../Utils/string_constant.dart';

class AutheticationController extends GetxController {
  final authenticationRepository =
      AuthenticationRepository(APIManager(), PostAPIManager());
  TextEditingController emailLoginController = TextEditingController(text: '');
  TextEditingController pwdLoginController = TextEditingController(text: '');

  TextEditingController usernameSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController pwdSignUpController = TextEditingController();
  TextEditingController conpwdSignUpController = TextEditingController();
  TextEditingController phnoSignUpController = TextEditingController();

  Rx<LoginResponseModel> loginDetails = LoginResponseModel().obs;
  Rx<LoginResponseModel> ragistarDetails = LoginResponseModel().obs;
  Rx<CurrentUserResponseModel> currentUserDetails =
      CurrentUserResponseModel().obs;

  //********************** sign in with E-mail & Password **********************//

  signInWithEmailPassword({
    required BuildContext context,
  }) async {
    loginDetails.value = await authenticationRepository.loginApiCall(
      email: emailLoginController.text.trim(),
      password: pwdLoginController.text.trim(),
    );

    // success message & navigation

    if (loginDetails.value.status == true) {
      GetStorage().write(userData, loginDetails.toJson());
      successSnackBar(message: loginDetails.value.message);
      Get.offAllNamed(Routes.MAIN_SCREEN);
    } else {
      errorSnackBar(message: loginDetails.value.message);
    }

    update();
  }

  //********************** sign in with E-mail & Password **********************//

  ragistarWithEmailPassword({
    required BuildContext context,
  }) async {
    ragistarDetails.value = await authenticationRepository.registerApiCall(
      username: usernameSignUpController.text,
      email: emailSignUpController.text.trim(),
      password: pwdSignUpController.text.trim(),
      mobileno: phnoSignUpController.text.trim(),
      teleno: "",
      whatsno: "",
      city: "",
      country: "",
      experience: "",
      gender: "",
      image: "",
      role: "Email",
    );

    // success message & navigation

    if (ragistarDetails.value.status == true) {
      GetStorage().write(userData, ragistarDetails.toJson());
      successSnackBar(message: ragistarDetails.value.message);
      Get.offAllNamed(Routes.MAIN_SCREEN);
    } else {
      errorSnackBar(message: ragistarDetails.value.message);
    }

    update();
  }

  //********************** sign in with E-mail & Password **********************//

  // currentUser({
  //   required BuildContext context,
  // }) async {
  //   currentUserDetails.value =
  //       await authenticationRepository.currentUserApiCall();

  //   // success message & navigation

  //   if (currentUserDetails.value.status == true) {
  //   } else {
  //     errorSnackBar(message: currentUserDetails.value.message);
  //   }

  //   update();
  // }
}
