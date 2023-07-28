import 'dart:async';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';

import 'package:bp_treat/utils/prefs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../auth/view/register_screen_1.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final Prefrence _prefs = Prefrence.instance;

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  autoLogin() {
    String? userDetail = _prefs.getUserDetails();
    if (userDetail!.isEmpty) {
      Timer(const Duration(seconds: 3), () {
        Get.offAll(() => const RegisterScreen1());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.offAll(() => const LandingPage());

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/app_logo.png",
            height: 100.h,
            width: 100.w,
          ),
           SizedBox(
            height: 10.h,
          ),
          const Text(
            "Control Your Hypertension",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
            ),
          ),
        ],
      ),
    );
  }
}
