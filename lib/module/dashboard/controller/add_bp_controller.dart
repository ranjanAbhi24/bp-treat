import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/model/add_record.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/user_record.dart';

class AddBPController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence.instance;
  late TextEditingController noteController;
  List<Record>? _userRecord;
  List<Record>? get userrecord => _userRecord;
  AddRecord? _record;
  AddRecord? get record => _record;
  int systolicBPValue = 80;
  int diastolicBPValue = 60;
  int pulseValue = 70;
  bool isLoading = false;

  onSystolicValueChange(int value) {
    systolicBPValue = value;
    update();
  }

  onDiastolicValueChange(int value) {
    diastolicBPValue = value;
    update();
  }

  onPulseValueChange(int value) {
    pulseValue = value;
    update();
  }

  postRecord() async {
    try {
      var deviceToken = _prefs.getFCMToken();

      isLoading = true;
      _record = await _apiService.postUserRecord(
        systolicBPValue,
        diastolicBPValue,
        pulseValue,
       // noteController.text,
        'IOS',
        deviceToken,
      );
      if (_record?.status == "Success") {
        isLoading = false;
        DashboardController controller = Get.find<DashboardController>();

        await controller.userRecord();
        await controller.getGraphData();
        await controller.fetchNotification();


        ApplicationUtils.showSnackBar(
            titleText: _record?.status, messageText: _record?.msg);
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _record?.status, messageText: _record?.msg);
      }
    } catch (e) {
      isLoading = false;
      throw "CE ${e.toString()}";
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    noteController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    noteController.dispose();
  }
}
