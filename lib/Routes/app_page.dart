// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Screen/Authentication/login_screen.dart';
import 'package:coach_app/Screen/Authentication/signup_screen.dart';
import 'package:coach_app/Screen/Coures/all_video_screen.dart';
import 'package:coach_app/Screen/Coures/coures_add_screen.dart';
import 'package:coach_app/Screen/Coures/coures_view_screen.dart';
import 'package:coach_app/Screen/Coures/video_screen.dart';
import 'package:coach_app/Screen/Desboard/home_screen.dart';
import 'package:coach_app/Screen/Desboard/student_screen.dart';
import 'package:coach_app/Screen/Desboard/main_screen.dart';
import 'package:coach_app/Screen/Desboard/menu_screen.dart';
import 'package:coach_app/Screen/Menu/about_us_screen.dart';
import 'package:coach_app/Screen/Menu/change_password_screen.dart';
import 'package:coach_app/Screen/Menu/contact_us_screen.dart';
import 'package:coach_app/Screen/Menu/edit_profile_screen.dart';
import 'package:coach_app/Screen/Menu/terms_of_use_screen.dart';
import 'package:coach_app/Screen/Student/student_detaile_screen.dart';
import 'package:get/get.dart';

import '../Screen/Onboarding/splash_screen.dart';

Transition transition =
    Platform.isAndroid ? Transition.noTransition : Transition.cupertino;

class AppPages {
  static const INITIAL_ROUTE = Routes.SPLASH_SCREEN;
  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const LoginScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.SIGNUP_SCREEN,
      page: () => const SignUpScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.MAIN_SCREEN,
      page: () => const MainScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const HomeScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.USER_SCREEN,
      page: () => const StudenScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.MENU_SCREEN,
      page: () => const MenuScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.EDIT_PROFILE_SCREEN,
      page: () => const EditProfileScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.ABOUT_US_SCREEN,
      page: () => const AboutUsScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.CONTACT_US_SCREEN,
      page: () => const ConatctUsScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.TERMS_OF_USE_SCREEN,
      page: () => const TermsOfUseScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.COURES_ADD_SCREEN,
      page: () => const CouresAddScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.COURES_VIEW_SCREEN,
      page: () => const CouresViewScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.VIDEO_SCREEN,
      page: () => const VideoScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.STUDENT_DETAILE_SCREEN,
      page: () =>  const StudentDetileScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.ALL_VIDEO_SCREEN,
      page: () => const AllVideoScreen(),
      transition: transition,
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD_SCREEN,
      page: () => const ChangePasswordScreen(),
      transition: transition,
    ),
  //   GetPage(
  //     name: Routes.PRODUCT_COMPERISION_SCREEN,
  //     page: () => const ProductComperisionScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.PRODUCT_DETAILES_SCREEN,
  //     page: () => const ProducyDetailsScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.SHARE_APP_SCREEN,
  //     page: () => const ShareAppScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.EDIT_PROFILE_SCREEN,
  //     page: () => const EditProfileScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.BIDDING_SCREEN,
  //     page: () => const BiddingScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.BIDDING_DETAILES_SCREEN,
  //     page: () => const BiddingDetailScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.CONFIRM_BID_SCREEN,
  //     page: () => const ConfirmBidScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.MY_BIDDING_SCREEN,
  //     page: () => const MyBiddingScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.EDIT_MY_BID_SCREEN,
  //     page: () => const EditMyBidScreen(),
  //     transition: transition,
  //   ),
  //   GetPage(
  //     name: Routes.TERMS_OF_USE_SCREEN,
  //     page: () =>  const TermsOfUseScreen(),
  //     transition: transition,
  //   ),
  ];
}
