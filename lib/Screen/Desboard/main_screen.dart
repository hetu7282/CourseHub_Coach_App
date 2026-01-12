import 'package:coach_app/Controller/auth_controller.dart';
import 'package:coach_app/Controller/coures_controller.dart';
import 'package:coach_app/Controller/deshboard_controller.dart';
import 'package:coach_app/Controller/menu_controller.dart';
import 'package:coach_app/Controller/network_controller.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  CouresController couresController = Get.put(CouresController());
  MenuBarController menuBarController = Get.put(MenuBarController());
  
  AutheticationController autheticationController =
      Get.put(AutheticationController());
  NetworkController networkController =
      Get.put(NetworkController(), permanent: true);
  @override
  void initState() {
    super.initState();
    menuBarController.currentUser(context: context);
    dashboardController.sliderImage(context: context);
    dashboardController.categoryData(context: context);
   

  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: AppColor.transparent,
            highlightColor: AppColor.transparent,
            hoverColor: AppColor.transparent,
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              dashboardController.currentSelected.value = index;
            },
            height: 7.h,
            elevation: 0,
            backgroundColor: AppColor.blueColor,
            // indicatorColor: AppColor.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: dashboardController.currentSelected.value,
            destinations: <Widget>[
              // home icon
              NavigationDestination(
                selectedIcon: Image.asset(
                  Assets.assetsHomeicon,
                  scale: 3,
                  color: AppColor.whiteColor,
                ),
                icon: Image.asset(
                  Assets.assetsHomeicon,
                  color: AppColor.unselectediconColor,
                  scale: 3,
                ),
                label: '',
              ),

              // Student icon
              NavigationDestination(
                selectedIcon: Image.asset(
                  Assets.assetsStudent,
                  scale: 18,
                  color: AppColor.whiteColor,
                ),
                icon: Image.asset(
                  Assets.assetsStudent,
                  color: AppColor.unselectediconColor,
                  scale: 18,
                ),
                label: '',
              ),

              // my profile icon
              NavigationDestination(
                selectedIcon: Image.asset(
                  Assets.assetsProfileicon,
                  scale: 3,
                  color: AppColor.whiteColor,
                ),
                icon: Image.asset(
                  Assets.assetsProfileicon,
                  color: AppColor.unselectediconColor,
                  scale: 3,
                ),
                label: '',
              ),
            ],
          ),
        ),
        body: dashboardController.screenWidgets
            .elementAt(dashboardController.currentSelected.value),
      ),
    );
  }
}
