import 'package:bp_treat/module/contact/model/change_prescription.dart';
import 'package:bp_treat/module/contact/model/post_med.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  final ApiService _apiService = ApiService();
  ChangePrescription changePrescription = ChangePrescription();
  PostMed _postMed = PostMed();
  // final List<Medicine> _listOfMedicine = [];
  // List<Medicine> get listOfMedicine => _listOfMedicine;
  late TextEditingController descriptionController;
String dropdownValue="Select a choice..";
List<String> items= ['Select a choice..','Medication Side Effect','Medication Allergy','other'];
  List<String> selectedMedicines = [];
  bool? checkListValue = false;
  String? prescriptionID;
  bool isbtnActive = false;
  bool isLoading = false;

  // listmedicine() async {
  //   isLoading = true;
  //
  //   try {
  //     changePrescription = await _apiService.listMedicineForChange();
  //
  //     if (changePrescription.status == "Success") {
  //       isLoading = false;
  //
  //       final id = changePrescription.data?.prescriptionId;
  //       prescriptionID = id;
  //       debugPrint(' preID  : $prescriptionID');
  //       _listOfMedicine.addAll(changePrescription.data?.medicine ?? []);
  //     } else {
  //       isLoading = false;
  //       _listOfMedicine;
  //     }
  //   } catch (e) {
  //     debugPrint("CatchE : ${e.toString()}");
  //   }
  //   update();
  // }

  // Future<void> makePhoneCall(Uri url) async {
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // onMedSelect(String? med, bool isSelected) {
  //   if (isSelected) {
  //     selectedMedicines.add(med ?? "");
  //   } else {
  //     selectedMedicines.remove(med);
  //   }
  //   debugPrint(selectedMedicines.toString());
  //   update();
  // }

  // sendMedicineForChange(String pID) async {
  //   _postMed = await _apiService.postMedicineForChange(
  //     prescriptionID: pID,
  //     doctorID: "",
  //     medicine: selectedMedicines,
  //     otherIssue: descriptionController.text,
  //   );
  //   debugPrint("med $_postMed");
  //   try {
  //     if (_postMed.status == "Success") {
  //       return ApplicationUtils.showSnackBar(
  //           titleText: 'Request Accepted',
  //           messageText:
  //               'You request has been accepted. You will receive updated Prescription shortly.');
  //     } else {
  //       return ApplicationUtils.showSnackBar(
  //           titleText: 'Somthing went wrong',
  //           messageText: 'Please try again later');
  //     }
  //   } catch (e) {
  //     debugPrint("Catch Error : ${e.toString()}");
  //   }
  //   update();
  // }

  onChanged(value) {
    dropdownValue = value;
    if (dropdownValue == "Select a choice..") {
      dropdownValue = "Select a choice..";
    } else if (dropdownValue == "Medication Side Effect") {
      dropdownValue = "Medication Side Effect";
    } else if (dropdownValue == 'Medication Allergy') {
      dropdownValue = "Medication Allergy";
    } else {
      dropdownValue = "other";
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
   // listmedicine();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    descriptionController.dispose();
    super.dispose();
  }
}
