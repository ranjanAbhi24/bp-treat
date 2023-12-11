import 'dart:convert';

import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/service/auth_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final Prefrence _prefs = Prefrence.instance;
  AuthService authService = AuthService();

  bool isLoading = false;
  dynamic docInfo;

  logout() async {
    isLoading = true;
    bool isCleared = await _prefs.clearData();
    if (isCleared) {
      isLoading = false;
      Get.find<LandingController>().tabIndex=0;
      Get.offAll(() => const LoginScreen());
    //  Get.until((route) => Get.currentRoute == const LoginScreen());
    }
    update();
  }

  deletePatientAccount() async {
    String? jsonData = _prefs.getUserDetails();
    var userInfo;
    if(jsonData!.isNotEmpty){
     userInfo = json.decode(jsonData);
    }
    print("delete--$userInfo");
    var id = userInfo['data']["_id"];
    print("delete_id -- $id");
    try{
       EasyLoading.show();
      await authService.deleteAccount(id);
       EasyLoading.dismiss();
    }
    catch(e){
      throw Exception(e);
    }

  }


}
