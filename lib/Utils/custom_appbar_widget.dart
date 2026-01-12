import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText, actionicon, actionextraicon;
  final Function()? leadingOnTap, actionsOnTap, actionsextraOnTap;
  final bool isLeadingButton,
      isActionsButton,
      isActionsExtraButton,
      isActionwidget;
  final Widget? child;

  const CustomAppBar({
    Key? key,
    this.titleText,
    this.leadingOnTap,
    this.actionsOnTap,
    this.actionsextraOnTap,
    this.child,
    this.actionicon,
    this.actionextraicon,
    this.isLeadingButton = true,
    this.isActionsButton = false,
    this.isActionwidget = false,
    this.isActionsExtraButton = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size(100.0.w, 7.0.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: customText(
            titleText!,
            color: AppColor.blackColor,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          if (isActionwidget == true) ...[
            child!
          ] else ...[
            isActionsExtraButton == true
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: GestureDetector(
                      onTap: actionsextraOnTap,
                      child: Padding(
                        // padding: EdgeInsets.all(2.h),
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Image.asset(
                          actionextraicon!,
                        ),
                      ),
                    ),
                  )
                : Container(),
            isActionsButton == true
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: GestureDetector(
                      onTap: actionsOnTap,
                      child: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Image.asset(
                          actionicon!,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ],
        leading: isLeadingButton == true
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Image.asset(
                      Assets.assetsBack,
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
