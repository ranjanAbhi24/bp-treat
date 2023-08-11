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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:20.h),
                    Image.asset(
                        "assets/images/app_logo.png",
                        height: 110.h,
                        width: 100.w
                    ),
                    Text(
                      'Please enter code sent to your email',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20),
                    PinCodeTextField(
                      appContext: context,

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
                        fieldWidth: 70.w,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () async {
                          await controller.reSendOtp();
                        },
                        child: Text(
                          'resend code',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                    width: 200.w,
                      height: 50.h,
                      child: CommonElevatedButton(
                          onTap: () async {
                            await controller.verifyAndRegister();
                          },
                          title: "Get started", backgroundColor: kPrimaryColor,
                        textColor: kWhiteColor,
                      ),
                    )
                  ],
                ),
              );
           }),
    ));
  }
}
