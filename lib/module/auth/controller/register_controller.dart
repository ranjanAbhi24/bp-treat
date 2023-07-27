import 'dart:convert';

import 'package:bp_treat/module/auth/model/register.dart';
import 'package:bp_treat/module/auth/model/send_otp.dart';
import 'package:bp_treat/module/auth/view/otp_screen.dart';
import 'package:bp_treat/module/doctor/view/doctor_selection_screen.dart';
import 'package:bp_treat/service/auth_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consult/view/add_personal_profile.dart';

class RegisterController extends GetxController {
  final AuthService _auth = AuthService();
  final Prefrence _prefs = Prefrence.instance;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController userPhoneNumberController;
  late TextEditingController userZipcodeController;
  late TextEditingController userStateController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController otpController;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late GlobalKey<FormState> formKey;
  late GlobalKey<FormState> welcomeKey;

  bool isLoading = false;
  SendOtp? _sendOtp;
  SendOtp? get sendotp => _sendOtp;
  Register? _registerUser;
  Register? get register => _registerUser;
  bool isObsecure = true;
  bool isObsecureCNF = true;

  String? token;
  // String? patientID = '';
  bool? isChecked = false;
  String? userData;

  sendOtp() async {
    isLoading = true;
    _sendOtp = await _auth.sendOtpToEmail(emailController.text);
    print("email---${emailController.text}");
    if (_sendOtp?.status == "Success") {
      isLoading = false;
      Get.to(() => const OTPScreen());
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: 'Error',
          messageText: _sendOtp!.msg ?? "Something wrong.Try again");
    }
    update();
  }

  reSendOtp() async {
    isLoading = true;
    print(emailController.text);
    _sendOtp = await _auth.sendOtpToEmail(emailController.text);
    if (_sendOtp?.status == "Success") {
      isLoading = false;
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: 'Error',
          messageText: _sendOtp!.msg ?? "Something wrong.Try again");
    }
    update();
  }

  verifyAndRegister() async {
    String fcmToken = _prefs.getFCMToken();
    try {
      isLoading = true;
      _registerUser = await _auth.verifyOtpAndRegister(
        userEmail: emailController.text,
        userOTP: otpController.text,
        userPassword: passwordController.text,
        userFcmToken: fcmToken,
        userName: "${firstName.text} ${lastName.text}",
        // userMobile: userPhoneNumberController.text,
        // userState: userStateController.text,
        // userZipCode: userZipcodeController.text,
        privacyConsent: isChecked ?? true,
      );
print(_registerUser);
      if (_registerUser?.status == "Success") {
        isLoading = false;
        token = _registerUser?.data?.loginToken;
        // patientID = _registerUser?.data?.sId;
        await _prefs.setToken(token);

        await ApplicationUtils.showSnackBar(
            titleText: _registerUser?.status, messageText: _registerUser?.msg);
        Get.to(() => const AddPersonalProfile(),
        );
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _registerUser?.status, messageText: _registerUser?.msg);
      }
    } catch (e) {
      isLoading = false;

      debugPrint("catch Error ${e.toString()}");
    }
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

  toggleCheckBox(bool? value) {
    isChecked = value;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    firstName=TextEditingController();
    lastName=TextEditingController();
    userNameController = TextEditingController();

    emailController = TextEditingController();
    userPhoneNumberController = TextEditingController();
    userStateController = TextEditingController();
    userZipcodeController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    otpController = TextEditingController();
    formKey = GlobalKey<FormState>();
    welcomeKey=GlobalKey<FormState>();
  }


  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    firstName.dispose();
    lastName.dispose();
    userPhoneNumberController.dispose();
    userStateController.dispose();
    userZipcodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
  }
}
