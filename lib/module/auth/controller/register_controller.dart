import 'package:bp_treat/module/auth/model/register.dart';
import 'package:bp_treat/module/auth/model/send_otp.dart';
import 'package:bp_treat/module/auth/view/otp_screen.dart';
import 'package:bp_treat/module/doctor/view/doctor_selection_screen.dart';
import 'package:bp_treat/service/auth_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthService _auth = AuthService();
  final Prefrence _prefs = Prefrence();
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController userPhoneNumberController;
  late TextEditingController userZipcodeController;
  late TextEditingController userStateController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController otpController;
  late GlobalKey<FormState> formKey;

  bool isLoading = false;
  SendOtp? _sendOtp;
  SendOtp? get sendotp => _sendOtp;
  Register? _registerUser;
  Register? get register => _registerUser;
  bool isObsecure = true;
  bool isObsecureCNF = true;
  String userData = '';
  String? token;
  bool? isChecked = false;

  sendOtp() async {
    isLoading = true;
    _sendOtp = await _auth.sendOtpToEmail(emailController.text);
    if (_sendOtp?.status == "Success") {
      isLoading = false;
      Get.to(() => const OTPScreen());
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: 'Error',
          messageText: _sendOtp!.msg ?? "Somthing wrong.Try again");
    }
    update();
  }

  reSendOtp() async {
    isLoading = true;
    _sendOtp = await _auth.sendOtpToEmail(emailController.text);
    if (_sendOtp?.status == "Success") {
      isLoading = false;
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: 'Error',
          messageText: _sendOtp!.msg ?? "Somthing wrong.Try again");
    }
    update();
  }

  verifyAndRegister() async {
    String fcmToken = await _prefs.getFCMToken();
    try {
      isLoading = true;
      _registerUser = await _auth.verifyOtpAndRegister(
        userEmail: emailController.text,
        userOTP: otpController.text,
        userPassword: passwordController.text,
        userFcmToken: fcmToken,
        userName: userNameController.text,
        // userMobile: userPhoneNumberController.text,
        // userState: userStateController.text,
        // userZipCode: userZipcodeController.text,
        privacyConsent: isChecked ?? true,
      );
      debugPrint("register ${_registerUser?.msg}");
      if (_registerUser?.status == "Success") {
        isLoading = false;
        token = _registerUser?.data?.loginToken;
        // userData = json.encode(_registerUser);
        await Prefrence.setToken(token);
        // await _prefs.setUserDetails(userData);
        await ApplicationUtils.showSnackBar(
            titleText: _registerUser?.status, messageText: _registerUser?.msg);
        Get.offAll(() => const DoctorSelectionScreen());
      } else {
        ApplicationUtils.showSnackBar(
            titleText: _registerUser?.status, messageText: _registerUser?.msg);
      }
    } catch (e) {
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
    userNameController = TextEditingController();
    emailController = TextEditingController();
    userPhoneNumberController = TextEditingController();
    userStateController = TextEditingController();
    userZipcodeController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    otpController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    userPhoneNumberController.dispose();
    userStateController.dispose();
    userZipcodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
  }
}
