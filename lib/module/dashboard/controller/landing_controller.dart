import 'dart:convert';
import 'package:bp_treat/module/account/view/account_page.dart';
import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/contact/view/contact_view.dart';
import 'package:bp_treat/module/dashboard/model/graph.dart';
import 'package:bp_treat/module/dashboard/model/user_record.dart';
import 'package:bp_treat/module/dashboard/view/dashboard_view.dart';
import 'package:bp_treat/module/medicine/view/medicine_view.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final Prefrence _prefs = Prefrence();
  var tabIndex = 0;

  User? _user;
  User? get userData => _user;

  List<Record>? _userRecord;
  List<Record>? get record => _userRecord;

  GraphModel? _graphData;
  GraphModel? get graphData => _graphData;

  List<Graph>? _listOfGraph;
  List<Graph>? get listOfGraph => _listOfGraph;

  UserRecord? _patientRecord;
  UserRecord? get patientRecord => _patientRecord;

  bool isLoading = false;
  String? doctorID;
  String? prescriptionID;
  bool? userConsent = false;

  final List<Widget> pages = [
    const DashBoardView(),
    const MedicineView(),
    const ChatView(),
    const AccountPage(),
  ];

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  getUserDetails() async {
    String jsonUser = await _prefs.getUserDetails();
    Map<String, dynamic> jsonData = jsonDecode(jsonUser);
    _user = User.fromJson(jsonData);
    debugPrint("UserModel : ${_user?.data?.name}");
    update();
  }

  getUserConsent() async {
    userConsent = await _prefs.getConsent();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
    getUserConsent();
  }
}
