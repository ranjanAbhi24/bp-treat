
import 'package:bp_treat/module/contact/model/contact_doctor_model.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';


class ContactController extends GetxController {


final ApiService _apiService = ApiService();
  late TextEditingController descriptionController;
String dropdownValue="Select a choice..";
List<String> items= ['Select a choice..','Medication Side Effect','Medication Allergy','other'];
ContactDoctor? contactDoctor;
String option1="";
String option2="";
String option3="";

  bool isLoading = false;

addContactDetails({String? doctorId}) async {
  isLoading=true;
  contactDoctor = await _apiService.contactDoctor(
      docId: doctorId,
      medication: option1,
      sideEffect: '',
      medicationAllergy: option2,
      other: option3,
      description: descriptionController.text
  );
  if(contactDoctor?.status == "Success"){
    isLoading=false;
    ApplicationUtils.showSnackBar(
        titleText: "Congrats",
        messageText: contactDoctor?.msg);
  }else{
    isLoading = false;
    ApplicationUtils.showSnackBar(titleText: "Fail", messageText:contactDoctor?.msg);
  }
}



  onChanged(value) {
    dropdownValue = value;
    if (dropdownValue == "Select a choice..") {
      dropdownValue = "Select a choice..";
    } else if (dropdownValue == "Medication Side Effect") {
      dropdownValue = "Medication Side Effect";
     option1 = "Medication Side Effect";
     option2='';
     option3='';
    } else if (dropdownValue == 'Medication Allergy') {
      dropdownValue = "Medication Allergy";
      option2 = "Medication Allergy";
      option3="";
      option1="";
    } else {
      dropdownValue = "other";
      option3 ="other";
      option2='';
      option1='';
    }
    update();
  }



  @override
  void onInit() {
    super.onInit();

    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    descriptionController.dispose();
    super.dispose();
  }
}
