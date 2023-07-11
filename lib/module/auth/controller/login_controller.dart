import 'dart:convert';
import 'dart:developer';

import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/service/auth_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService _auth = AuthService();
  final Prefrence _prefs = Prefrence.instance;

  User? _loginUser;
  User? get loginUser => _loginUser;

  bool isLoading = false;

  bool isObsecure = true;
  String? token;
  String userData = '';
  String? patientID;

  late TextEditingController emailController, passwordController;
  late GlobalKey<FormState> loginFormKey;

  showPassword() {
    isObsecure = !isObsecure;
    update();
  }

  login() async {
    try {
      isLoading = true;
      _loginUser =
          await _auth.loginUser(emailController.text, passwordController.text);
      if (_loginUser?.status == "Success") {
        isLoading = false;
        token = _loginUser?.data?.loginToken;
        userData = json.encode(_loginUser);
        patientID = _loginUser?.data?.sId;
        await _prefs.setToken(token);
        await _prefs.setUserDetails(userData);
        Get.offAll(() => const LandingPage());
      } else {
        isLoading = false;
        return ApplicationUtils.showSnackBar(
            titleText: _loginUser?.status, messageText: _loginUser?.msg);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getFcmTokenn();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
  }

  getFcmTokenn() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await _prefs.setFCMToken(token);
      log("TOKEN $token");
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
