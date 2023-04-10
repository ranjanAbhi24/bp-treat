import 'dart:convert';

import 'package:bp_treat/module/consult/view/doctor_consultation.dart';
import 'package:bp_treat/module/doctor/model/doctor_model.dart';
import 'package:bp_treat/module/doctor/model/select_doc.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence();
  DoctorModel _docModel = DoctorModel();
  DoctorModel get docModel => _docModel;
  final List<Doctor> _listOfDoctor = [];
  List<Doctor> get listOfDoctor => _listOfDoctor;
  SelectDoctor selectDoctor = SelectDoctor();
  String? docID;
  String? role;
  String? docName;
  String userData = '';

  bool isLoading = false;

  fetchDocList() async {
    isLoading = true;
    _docModel = await _apiService.fetchDoctorList();
    if (docModel.status == "Success") {
      isLoading = false;
      _listOfDoctor.addAll(_docModel.docotr ?? []);
    }
    update();
  }

  selectDoc({required String doctorID, required String docRole}) async {
    selectDoctor =
        await _apiService.selectDoctor(doctorID: doctorID, role: docRole);

    if (selectDoctor.status == "Success") {
      userData = jsonEncode(selectDoctor);
      debugPrint("json $userData");
      await _prefs.setUserDetails(userData);
      Get.offAll(() => const DoctorConsultationConsent());
    } else {
      ApplicationUtils.showSnackBar(
          titleText: selectDoctor.status, messageText: selectDoctor.msg);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchDocList();
  }
}
