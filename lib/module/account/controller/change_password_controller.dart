import 'dart:async';

import 'package:bp_treat/module/account/model/chagepassword_send_otp.dart';
import 'package:bp_treat/module/account/model/verify_otp.dart';
import 'package:bp_treat/module/auth/model/changepassword.dart';
import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/service/auth_service.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';

class ChangePasswordController extends GetxController {
  final AuthService _auth = AuthService();
  late TextEditingController otpController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;
  ChangePasswordSendOTP? otpData;
  VerifyOTP? verifiedOTP;
  bool isLoading = true;
  ChangePassword? _changePassword;
  ChangePassword? get changePassword => _changePassword;
  late CountdownController countdownController;

  bool isOtpFieldVisible = false;
  bool isChnagePassowrdFieldVisible = false;
  bool isObsecure = true;
  bool isObsecureCNF = true;
  bool isResendOTP = false;

  onTimerComplete() {
    isResendOTP = true;
    update();
  }

  showPassword() {
    isObsecure = !isObsecure;
    update();
  }

  showPasswordCNF() {
    isObsecureCNF = !isObsecureCNF;
    update();
  }

  sendOtpForPasswordChange() async {
    isLoading = true;
    otpData = await _auth.sendOTPForChangePassword(emailController.text);

    if (otpData?.status == 'Success') {
      isLoading = false;
      isOtpFieldVisible = true;
      otpData;
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: otpData?.status, messageText: otpData?.msg);
    }
    update();
  }

  resendOtp() async {
    isResendOTP = false;
    await sendOtpForPasswordChange();
    otpController.clear();
    countdownController.restart();
    update();
  }

  verifyOtp() async {
    verifiedOTP = await _auth.verifyOTPChangePass(
        emailController.text, otpController.text);

    if (verifiedOTP?.status == "Success") {
      isChnagePassowrdFieldVisible = true;
      ApplicationUtils.showSnackBar(
          titleText: verifiedOTP?.status, messageText: verifiedOTP?.msg);
    } else {
      isChnagePassowrdFieldVisible = false;
      ApplicationUtils.showSnackBar(
          titleText: "Failed", messageText: "Invalid OTP");
    }
    update();
  }

  changePasswordandLogin() async {
    try {
      isLoading = true;

      _changePassword = await _auth.changePassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (_changePassword?.status == "Success") {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _changePassword?.status,
            messageText: _changePassword?.msg);
        Get.offAll(() => const LoginScreen());
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _changePassword?.status,
            messageText: _changePassword?.msg);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    update();
  }

  inputOtp(String otp) async {
    otpController.text = otp;
    await verifyOtp();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
    countdownController = CountdownController(autoStart: true);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    errorController.close();
  }
}
