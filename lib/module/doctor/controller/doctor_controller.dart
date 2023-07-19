import 'dart:convert';

import 'package:bp_treat/module/consult/view/doctor_consultation.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/module/doctor/model/doctor_model.dart';
import 'package:bp_treat/module/doctor/model/select_doc.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:get/get.dart';

import '../view/doctor_virtual_visit.dart';

class DoctorController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence.instance;
  DoctorModel _docModel = DoctorModel();
  DoctorModel get docModel => _docModel;
  final List<Doctor> _listOfDoctor = [];
  List<Doctor> get listOfDoctor => _listOfDoctor;
  String? docContact;
  String? docID;
  String? role;
  String? docName;
  SelectDoctor? _selectDoctor;
  SelectDoctor? get selectDoctor => _selectDoctor;
  String? docData;

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
    print(doctorID);
    print(docRole);

    _selectDoctor =
        await _apiService.selectDoctor(doctorID: doctorID, role: docRole);

    if (_selectDoctor?.status == "Success") {
      docData = json.encode(_selectDoctor);
      ApplicationUtils.showSnackBar(
          titleText: _selectDoctor?.status, messageText: _selectDoctor?.msg);


      //Get.find<LandingController>().getUserDetails();
      Get.offAll(()=> const LandingPage());
      //Get.offAll(() => const DoctorConsultationConsent());
    } else {
      ApplicationUtils.showSnackBar(
          titleText: _selectDoctor?.status, messageText: _selectDoctor?.msg);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchDocList();
  }
}
