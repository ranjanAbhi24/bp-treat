import 'package:bp_treat/module/account/controller/change_password_controller.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Change Password",
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ChangePasswordController>(
          init: ChangePasswordController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Please enter your email address',
                            style: Theme.of(context).textTheme.headline1,
                          )),
                      const SizedBox(height: 20),
                      InputTextField(
                          controller: controller.emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required*';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Enter correct email address.';
                            } else {
                              return null;
                            }
                          },
                          text: 'Email*'),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          backgroundColor: kPrimaryColor,
                          fixedSize: Size(
                            size.width,
                            50,
                          ),
                        ),
                        onPressed: () async {
                          bool isValid =
                              controller.formKey.currentState!.validate();
                          if (isValid) {
                            await controller.sendOtpForPasswordChange();
                          }
                        },
                        child: const Text('Send OTP'),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: controller.isOtpFieldVisible,
                        child: Column(
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('OTP')),
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
                                fieldHeight: 40,
                                fieldWidth: 60,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.white,
                              enableActiveFill: false,
                              errorAnimationController:
                                  controller.errorController,
                              controller: controller.otpController,
                              onCompleted: controller.inputOtp,
                              onChanged: (value) {},
                              beforeTextPaste: (text) {
                                return true;
                              },
                            ),
                            TextButton(
                              onPressed: controller.isResendOTP
                                  ? () async {
                                      controller.resendOtp();
                                    }
                                  : null,
                              child: Text(
                                'Resend OTP',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        color: controller.isResendOTP
                                            ? kBlackColor?.withOpacity(0.7)
                                            : kBlackColor?.withOpacity(0.3)),
                              ),
                            ),
                            Countdown(
                              seconds: 60,
                              build: (BuildContext context, double time) =>
                                  Text(time.toStringAsFixed(0)),
                              interval: const Duration(seconds: 1),
                              onFinished: controller.onTimerComplete,
                              controller: controller.countdownController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Visibility(
                          visible: controller.isChnagePassowrdFieldVisible,
                          child: Form(
                            key: controller.formKey2,
                            child: Column(
                              children: [
                                InputTextField(
                                  text: "Password*",
                                  controller: controller.passwordController,
                                  inputType: TextInputType.text,
                                  isVisible: controller.isObsecure,
                                  icon: controller.isObsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  onTap: controller.showPassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password can not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                InputTextField(
                                  text: "Confirm Password*",
                                  controller:
                                      controller.confirmPasswordController,
                                  inputType: TextInputType.text,
                                  isVisible: controller.isObsecureCNF,
                                  icon: controller.isObsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  onTap: controller.showPasswordCNF,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password can not be empty';
                                    } else if (value !=
                                        controller.passwordController.text) {
                                      return "Password did not match.Try Again";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    backgroundColor: kPrimaryColor,
                                    fixedSize: Size(
                                      size.width,
                                      50,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (controller.formKey2.currentState!
                                        .validate()) {
                                      await EasyLoading.show();
                                      await controller.changePasswordandLogin();
                                      await EasyLoading.dismiss();
                                    }
                                  },
                                  child: const Text('Change Password'),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
