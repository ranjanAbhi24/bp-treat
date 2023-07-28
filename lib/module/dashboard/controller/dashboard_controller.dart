import 'package:bp_treat/module/account/model/user_detail.dart';
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
  final Prefrence _prefs = Prefrence.instance;
  bool isLoading = false;

  UserDetail? _userDetail;
  UserDetail? get userDetail => _userDetail;

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

  String dropDownValue = '24 hour';
  bool badgeStatus = false;

  List<String> items = [
    '24 hour',
    '7 days',
    '28 days',
    'yearly'
  ];

  badgeStatusFn() async {
    badgeStatus = await _prefs.getBadgStatus();
    debugPrint('BadgeStatus: $badgeStatus');

    update();
  }

  Future fetchNotification() async {
    isLoading = true;
    final patientID = Get.find<LandingController>().userInfo['data']["_id"];

    try {
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

  Future userRecord() async {
    isLoading = true;
    final patientID = Get.find<LandingController>().userInfo['data']['_id'];

    try {
      _patientRecord = await _apiService.getUserRecord(patientID);
      if (_patientRecord?.status == "Success") {
        _record.clear();
        isLoading = false;
        _record.addAll(_patientRecord?.record ?? []);
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _patientRecord?.status,
            messageText: _patientRecord?.msg);
      }
    } catch (e) {
    throw Exception(e);
    }
    update();
  }

  Future getGraphData({String? dropDownValue}) async {
    final patientID = Get.find<LandingController>().userInfo['data']['_id'];

    _graphModel =
        await _apiService.fetchGraph(dropDownValue ?? 'week', patientID);
    if (_graphModel?.status == "Success") {
      _listOfGraphData.clear();
      _listOfGraphData.addAll(_graphModel?.graph ?? []);
    }
    update();
  }

  onChangeValue(value) {
    dropDownValue = value;
    if (dropDownValue == "24 hour") {
      getGraphData(dropDownValue: 'hour');
    } else if (dropDownValue == '7 days') {
      getGraphData(dropDownValue: 'week');
    } else if (dropDownValue == '28 days') {
      getGraphData(dropDownValue: 'month');
    } else {
      getGraphData(dropDownValue: 'year');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchNotification();
    badgeStatusFn();
    userRecord();
    getGraphData();
  }


}
