import 'package:bp_treat/module/auth/controller/register_controller.dart';
import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/module/auth/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/app_theme.dart';

import '../../../utils/size.dart';
import '../widget/common_elevated_button.dart';
import '../widget/input_textfield.dart';


class RegisterScreen1 extends StatelessWidget {
  const RegisterScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
         Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: GetBuilder<RegisterController>(
              init: RegisterController(),
              builder: (controller){
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                    EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Image.asset(
                            "assets/images/app_logo.png",
                              height: 110.h,
                              width: 100.w
                          ),
                           Text("Welcome to the app that helps you"
                              " monitor your blood pressure to get "
                              "treatment,should you need it",
                         textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: kBlackColor
                            ),
                          ),
                           SizedBox(
                            height: 40.h,
                          ),
                          Form(
                            key: controller.welcomeKey,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 250.w,
                                    child: InputTextField(
                                        text: 'Please tell us your first name',
                                        controller: controller.firstName,
                                        inputType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required*';
                                          }
                                          return null;
                                        }),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  SizedBox(
                                    width:250.w,
                                    child: InputTextField(
                                        text: 'Please tell us your last name',
                                        controller: controller.lastName,
                                        inputType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required*';
                                          }
                                          return null;
                                        }),
                                  ),
                                 SizedBox(
                                    height: 40.h,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.to(()=> const LoginScreen());
                                    },
                                    child: Text("Already have an account?",
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: kBlackColor

                                    )
                                    ),
                                  ),
                              SizedBox(
                                    height: 40.h,
                                  ),
                                  SizedBox(
                                    width: 200.w,
                                    child: CommonElevatedButton(
                                      title: 'Get Started',
                                      onTap:
                                   //   controller.isChecked == false?
                                        () {
                                      //   ApplicationUtils.showSnackBar(
                                      //       titleText: 'Error',
                                      //       messageText:
                                      //       'Please accept our terms and Privacy Policy to continue.');
                                      // }
                                      //     : () async {
                                        if (controller.welcomeKey.currentState!
                                            .validate()) {
                                          Get.to(()=>const RegisterScreen(),
                                          arguments: ["${controller.firstName.text}\t${controller.lastName.text}"]
                                          );
                                          // EasyLoading.show(status: 'Generating Otp...');
                                          // await controller.sendOtp();
                                          // EasyLoading.dismiss();
                                        }
                                      }, backgroundColor: kPrimaryColor,
                                      textColor: kWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  )
                );
              },
            ),

         )
      );

  }
}
