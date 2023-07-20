import 'dart:convert';
import 'package:bp_treat/module/account/view/account_page.dart';
import 'package:bp_treat/module/contact/view/contact_view.dart';
import 'package:bp_treat/module/dashboard/view/add_bp_view.dart';
import 'package:bp_treat/module/dashboard/view/dashboard_view.dart';
import 'package:bp_treat/module/medicine/view/medicine_view.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final Prefrence _prefs = Prefrence.instance;

  var tabIndex = 0;
dynamic userInfo;

  Widget getPage(int index) {
    switch (index) {
      case 0:
        //return DashBoardView();
        return const AddBPView();
      case 1:
        //return const MedicineView();
        return DashBoardView();
      case 2:
        return const ChatView();
      case 3:
        return const AccountPage();
      default:
        return const AddBPView();
    }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  getUserDetails() {
    final jsonData = _prefs.getUserDetails();
    if(jsonData!.isNotEmpty){
      userInfo = json.decode(jsonData);

    }
    print(userInfo);
   // print("prefs data : ${userInfo['data']["_id"]}");
update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }
}
