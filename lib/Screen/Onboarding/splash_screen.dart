import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Utils/app_color.dart';
import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween(begin: 0.0, end: 150.0).animate(animationController);
    animationController.forward();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.blueColor,
              AppColor.whiteColor,
              AppColor.blueColor,
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            builder: (context, child) {
              return Image.asset(
                Assets.assetsLogo,
                height: animation.value,
                width: animation.value,
              );
            },
            animation: animation,
          ),
        ),
      ),
    );
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    if (GetStorage().read(userData) == null) {
      // Get.offAllNamed(Routes.LOGIN_SCREEN);
      Get.offAllNamed(Routes.LOGIN_SCREEN);
      // Get.offAllNamed(Routes.SIGNUP_SCREEN);
    } else {
      Get.offAllNamed(Routes.MAIN_SCREEN);
      // Get.offAllNamed(Routes.SIGNUP_SCREEN);
    }
  }
}
