import 'dart:convert';
import 'package:bp_treat/module/account/controller/account_controller.dart';
import 'package:bp_treat/module/account/model/user_detail.dart';
import 'package:bp_treat/module/account/view/account_page.dart';
import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/contact/controller/contact_controller.dart';
import 'package:bp_treat/module/contact/view/contact_view.dart';
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/model/graph.dart';
import 'package:bp_treat/module/dashboard/model/user_record.dart';
import 'package:bp_treat/module/dashboard/view/dashboard_view.dart';
import 'package:bp_treat/module/medicine/controller/medicine_controller.dart';
import 'package:bp_treat/module/medicine/view/medicine_view.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final Prefrence _prefs = Prefrence();
  final ApiService _apiService = ApiService();
  var tabIndex = 0;

  List<Record>? _userRecord;
  List<Record>? get record => _userRecord;

  GraphModel? _graphData;
  GraphModel? get graphData => _graphData;

  List<Graph>? _listOfGraph;
  List<Graph>? get listOfGraph => _listOfGraph;

  UserRecord? _patientRecord;
  UserRecord? get patientRecord => _patientRecord;

  UserDetail? _userDetail;
  UserDetail? get userDetail => _userDetail;

  bool isLoading = false;
  String? doctorID;
  String? prescriptionID;
  bool? userConsent = false;

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const DashBoardView();
      case 1:
        return const MedicineView();
      case 2:
        return const ChatView();
      case 3:
        return const AccountPage();
      default:
        return const DashBoardView();
    }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    if (index == 0) {
      Get.delete<DashboardController>();
      Get.put(DashboardController());
    } else if (index == 1) {
      Get.delete<MedicineController>();
      Get.put(MedicineController());
    } else if (index == 2) {
      Get.delete<ContactController>();
      Get.put(ContactController());
    } else {
      Get.delete<AccountController>();
      Get.put(AccountController());
    }
    update();
  }

  getBasicUserDetails() async {
    isLoading = true;
    await _apiService.getUserDetails().then((value) {
      isLoading = false;
      print("valueeee ${value.data?.name}");
      value = _userDetail!;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    getBasicUserDetails();
  }
}
