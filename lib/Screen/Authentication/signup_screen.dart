import 'package:coach_app/Controller/auth_controller.dart';
import 'package:coach_app/Utils/custom_textfiled.dart';
import 'package:coach_app/Utils/custom_widget.dart';
import 'package:coach_app/generated/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AutheticationController autheticationController = Get.find();
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    autheticationController.usernameSignUpController.clear();
    autheticationController.emailSignUpController.clear();
    autheticationController.phnoSignUpController.clear();
    autheticationController.pwdSignUpController.clear();
    autheticationController.conpwdSignUpController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Form(
                key: signupKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Image.asset(
                        Assets.assetsLogo,
                        scale: 5,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        child: CustomTextFiled(
                            hintText: "Username",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                autheticationController.usernameSignUpController
                                    .clear();
                                return 'Please enter username';
                              }
                              return null;
                            },
                            controller: autheticationController
                                .usernameSignUpController),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        child: CustomTextFiled(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            hintText: "Email",
                            validator: (value) {
                              RegExp emailRegExp = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (value!.trim().isEmpty) {
                                autheticationController.emailSignUpController
                                    .clear();
                                return 'Please enter email';
                              } else if (!emailRegExp.hasMatch(value)) {
                                return 'Enter valid email address';
                              }
                              return null;
                            },
                            controller:
                                autheticationController.emailSignUpController),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        child: CustomTextFiled(
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            hintText: "Phone No",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                autheticationController.phnoSignUpController
                                    .clear();
                                return 'Please enter phone no';
                              }
                              if (value.length != 10) {
                                return 'Phone Number must be of 10 digit';
                              }
                              return null;
                            },
                            controller:
                                autheticationController.phnoSignUpController),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        child: CustomTextFiled(
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            hintText: "Password",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                autheticationController.pwdSignUpController
                                    .clear();
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password must be atleast 6 characters long';
                              }
                              return null;
                            },
                            controller:
                                autheticationController.pwdSignUpController),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        child: CustomTextFiled(
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            hintText: "Confirm Password",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                autheticationController.conpwdSignUpController
                                    .clear();
                                return "Please enter your password";
                              } else if (autheticationController
                                      .pwdSignUpController.text !=
                                  autheticationController
                                      .conpwdSignUpController.text) {
                                return 'Passwords doesnt match';
                              } else {
                                return null;
                              }
                            },
                            controller:
                                autheticationController.conpwdSignUpController),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      customButton(
                        text: "Sign Up",
                        onPressed: () {
                          if (signupKey.currentState!.validate()) {
                            autheticationController.ragistarWithEmailPassword(
                                context: context);
                          }
                        },
                        width: 90.w,
                        height: 6.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      richText(
                          text1: "Already have an account? ",
                          text2: "Login here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              autheticationController.emailLoginController
                                  .clear();
                              autheticationController.pwdLoginController
                                  .clear();
                              Get.back();
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
