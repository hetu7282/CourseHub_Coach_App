import 'package:coach_app/Controller/auth_controller.dart';
import 'package:coach_app/Routes/routes.dart';
import 'package:coach_app/Utils/app_color.dart';
import 'package:coach_app/Utils/custom_textfiled.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AutheticationController autheticationController =
      Get.put(AutheticationController());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

@override
  void dispose() {
    super.dispose();
    autheticationController.emailLoginController.clear();
    autheticationController.pwdLoginController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Form(
                key: loginKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        Assets.assetsLogo,
                        scale: 5,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        //  height: 6.h,
                        child: CustomTextFiled(   keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              RegExp emailRegExp = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (value!.trim().isEmpty) {
                                autheticationController.emailLoginController
                                    .clear();
                                return 'Please enter email';
                              } else if (!emailRegExp.hasMatch(value)) {
                                return 'Enter valid email address';
                              }
                              return null;
                            },
                            hintText: "Email",
                            controller:
                                autheticationController.emailLoginController),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        // height: 6.h,
                        child: CustomTextFiled(   keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                autheticationController.pwdLoginController
                                    .clear();
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password must be atleast 6 characters long';
                              }
                              return null;
                            },
                            hintText: "Password",
                            controller:
                                autheticationController.pwdLoginController),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      customButton(
                        text: "Login",
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                         
                            autheticationController.signInWithEmailPassword(context: context);
                          }
                        },
                        width: 90.w,
                        height: 6.h,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      
                      // const Spacer(),
        
                      richText(
                          text1: "Don’t have an account? ",
                          text2: "Register here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.SIGNUP_SCREEN);
                            }),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
