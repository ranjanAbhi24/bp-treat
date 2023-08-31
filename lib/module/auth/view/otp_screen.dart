import 'dart:async';

import 'package:bp_treat/module/auth/controller/register_controller.dart';
import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:bp_treat/utils/app_theme.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
         child: Scaffold(
           resizeToAvoidBottomInset: false,
      body: GetBuilder<RegisterController>(
           init: RegisterController(),
           builder: (controller) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:20.h),
                   Text("Verify your Email",
                   style: Theme.of(context).textTheme!.headline1!.copyWith(
                     color: const Color.fromRGBO(193, 65, 66, 1)
                   ),
                   ),
                    SizedBox(height:10.h),
                    Text("We sent an email to the address you provided on the previous screen.",
                    style: Theme.of(context).textTheme!.subtitle1!.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.normal
                    ),
                    ),
                     SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      'Please enter code in your email',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20),
                    PinCodeTextField(
                      appContext: context,
                      autoDisposeControllers: false,
                      length: 4,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50.h,
                        fieldWidth: 60.w,
                        inactiveColor: kBlackColor,
                        //fieldOuterPadding: EdgeInsets.all(5),
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.white,
                      enableActiveFill: false,
                      errorAnimationController: errorController,
                      controller: controller.otpController,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                   SizedBox(
                      height: 60.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          await controller.reSendOtp();
                        },
                        child: Text(
                          'Resend the code?',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                //fontSize: 14,
                                color: kBlackColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Change email?",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            //fontSize: 14,
                            color: kBlackColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                 SizedBox(
                   height: 100.h,
                 ),
                    Text("Next,we will create your health profile.",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      //fontSize: 14,
                      color: kBlackColor,
                     fontWeight: FontWeight.w500
                    ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: SizedBox(
                      width: 200.w,
                        height: 50.h,
                        child: CommonElevatedButton(
                            onTap: () async {
                              await controller.verifyAndRegister();
                            },
                            title: "Continue", backgroundColor: kPrimaryColor,
                          textColor: kWhiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              );
           }),
    ));
  }
}
