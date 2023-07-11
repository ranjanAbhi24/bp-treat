import 'dart:async';

import 'package:bp_treat/module/account/model/chagepassword_send_otp.dart';
import 'package:bp_treat/module/account/model/verify_otp.dart';
import 'package:bp_treat/module/auth/model/changepassword.dart';
import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/service/auth_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';

class ForgotPasswordController extends GetxController {
  final AuthService _auth = AuthService();
  final Prefrence _prefs = Prefrence.instance;
  late TextEditingController otpController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late StreamController<ErrorAnimationType> errorController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  ChangePasswordSendOTP? otpData;
  VerifyOTP? verifiedOTP;
  bool isLoading = true;
  ChangePassword? _changePassword;
  ChangePassword? get changePassword => _changePassword;

  bool isOtpFieldVisible = false;
  bool isChangePassowrdFieldVisible = false;
  bool isObsecure = true;
  bool isObsecureCNF = true;
  bool isResendOTP = false;
  late CountdownController countdownController;

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

  resendOtp() async {
    isResendOTP = false;
    await sendOtpForPasswordChange();
    otpController.clear();
    countdownController.restart();
  }

  sendOtpForPasswordChange() async {
    isLoading = true;
    otpData = await _auth.sendOTPForChangePassword(emailController.text);
    if (otpData?.status == 'Success') {
      isLoading = false;
      isOtpFieldVisible = true;
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: otpData?.status, messageText: otpData?.msg);
    }
    update();
  }

  verifyOtp() async {
    try {
      isLoading = true;
      verifiedOTP = await _auth.verifyOTPChangePass(
          emailController.text, otpController.text);

      if (verifiedOTP?.status == "Success") {
        isLoading = false;
        isChangePassowrdFieldVisible = true;
        await _prefs.setToken(verifiedOTP?.data?.loginToken);
        ApplicationUtils.showSnackBar(
            titleText: verifiedOTP?.status, messageText: verifiedOTP?.msg);
      } else {
        isLoading = false;
        isChangePassowrdFieldVisible = false;
        ApplicationUtils.showSnackBar(
            titleText: "Failed", messageText: "Invalid OTP");
      }
    } catch (e) {
      isLoading = false;
      debugPrint(e.toString());
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
      isLoading = false;
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
