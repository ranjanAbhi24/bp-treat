import 'dart:convert';
import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/model/graph.dart';
import 'package:bp_treat/module/dashboard/model/notification.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_record.dart';

class DashboardController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence();
  bool isLoading = false;

  User? _user;
  User? get userData => _user;

  UserRecord? _patientRecord;
  UserRecord? get patientRecord => _patientRecord;
  GraphModel? _graphModel;
  GraphModel? get graph => _graphModel;
  final List<Graph> _listOfGraphData = [];
  List<Graph> get listOfGraphData => _listOfGraphData;

  UserNotification? _userNotification;
  UserNotification? get userNotification => _userNotification;
  final List<Notify> _notificationList = [];
  List<Notify>? get notificationList => _notificationList;

  final List<Record> _record = [];
  List<Record> get record => _record;
  String patientID = "";
  String dropDownValue = 'Weekly';
  bool badgeStatus = false;
  List<String> items = [
    '24hr',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  badgeStatusFn() async {
    badgeStatus = await _prefs.getBadgStatus();
    debugPrint('BadgeStatus: $badgeStatus');
    update();
  }

  getUserDetails() async {
    String jsonUser = await _prefs.getUserDetails();
    Map<String, dynamic> jsonData = jsonDecode(jsonUser);
    _user = User.fromJson(jsonData);
    patientID = _user?.data?.sId ?? "";
    update();
  }

  fetchNotification() async {
    isLoading = true;
    try {
      await getUserDetails();
      _userNotification = await _apiService.getNotification(patientID);
      if (_userNotification?.status == "Success") {
        isLoading = false;
        _notificationList.addAll(_userNotification?.notify ?? []);
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _userNotification?.status,
            messageText: _userNotification?.msg);
      }
    } catch (e) {
      isLoading = false;
      debugPrint(e.toString());
    }
    update();
  }

  userRecord() async {
    isLoading = true;
    try {
      await getUserDetails();
      _patientRecord = await _apiService.getUserRecord(patientID);
      if (_patientRecord?.status == "Success") {
        _record.clear();
        isLoading = false;
        _record.addAll(_patientRecord?.record ?? []);
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: 'Error', messageText: "Errorr");
      }
    } catch (e) {
      throw Error();
    }
    update();
  }

  getGraphData({String? dropDownValue}) async {
    await Get.find<LandingController>().getUserDetails();
    _user = Get.find<LandingController>().userData;
    _graphModel = await _apiService.fetchGraph(
        dropDownValue ?? 'week', _user?.data?.sId ?? "");
    if (_graphModel?.status == "Success") {
      _listOfGraphData.clear();
      _listOfGraphData.addAll(_graphModel?.graph ?? []);
    }
    update();
  }

  onChangeValue(String value) {
    dropDownValue = value;
    if (dropDownValue == "24hr") {
      getGraphData(dropDownValue: 'hour');
    } else if (dropDownValue == 'Weekly') {
      getGraphData(dropDownValue: 'week');
    } else if (dropDownValue == 'Monthly') {
      getGraphData(dropDownValue: 'month');
    } else {
      getGraphData(dropDownValue: 'year');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    badgeStatusFn();
    getUserDetails();
    userRecord();
    getGraphData();
    fetchNotification();
    // onChangeValue('Weekly');
  }
}
