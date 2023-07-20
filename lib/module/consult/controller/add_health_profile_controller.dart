import 'dart:convert';

import 'package:bp_treat/module/consult/controller/add_profile_controller.dart';
import 'package:bp_treat/module/consult/view/profile_complete.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/prefs.dart';
import '../../../utils/show_snackbar.dart';
import '../model/add_consent.dart';
import '../../dashboard/controller/landing_controller.dart';
import '../../dashboard/view/landing_page.dart';

class AddHealthController extends GetxController {
  bool isMale = false;
  bool isFemale = false;
  AddConsent? _addConsent;
  DateTime selectDate = DateTime.now();
  final Prefrence _prefs = Prefrence.instance;
  late TextEditingController feetController;
  late TextEditingController inchesController;
  late TextEditingController allergiesController;
  late TextEditingController poundsController;
  late TextEditingController medicalConditionsController;
  late TextEditingController currentMedicationsController;
  late GlobalKey<FormState> page2FormKey;
  late GlobalKey<FormState> page3FormKey;
  bool isLoading=false;
  String select_gender = '';
 String dob ="";
  String haveDiabetes = "";
  bool isNarcotics = false;
  bool diabetesYes = false;
  bool diabetesNo = false;
  bool isDiabetic = false;
  bool isMarijuana = false;
 // bool istabacco=false;
  bool isAmphetamine = false;
  List<String> dropdownList = ["Select a choice..", "1", '2', "3"];
  List<String> list1 = ['Tabacco', 'Marijuana', 'None of these'];
  String selectValueL1 = '';
  String selectValueL2 = '';
  // String select_list1_value = "";
  // String select_list2_value = '';
  var selectedIndexesL1=[];
  var selectedIndexesL2=[];
  List<String> list2 = [
    'Narcotics',
    'Amphetamines',
    'Cocaine',
    'None of these'
  ];
  ApiService _apiService = ApiService();

  String dropDownValue = 'Select a choice..';

  addUserHealthDetail() async{
   try{
     isLoading=true;
     _addConsent= await _apiService.addPatientConsent(
         mobile: Get.find<AddProfileController>().phoneNumberController.text,
         zipcode: int.parse(Get.find<AddProfileController>().zipCodeController.text),
         gender: select_gender,
         dateOfBirth: dob,
         height: double.parse("${feetController.text}.${inchesController.text}"),
         weight: poundsController.text,
         allergies: allergiesController.text,
         isDiabetic: isDiabetic,
         medication: currentMedicationsController.text,
         isNarcotics: selectedIndexesL2.contains(0),
         isMarijuana: selectedIndexesL1.contains(1),
         isAmphetamine: selectedIndexesL2.contains(1),
         isCocaine: selectedIndexesL2.contains(2),
         isTabacco: selectedIndexesL1.contains(0)

     );

     if(_addConsent?.status == "Success"){
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _addConsent?.status, messageText: _addConsent?.msg);
        await _prefs.setUserDetails(jsonEncode(_addConsent));
        Get.find<LandingController>().getUserDetails();
        Get.to(() => const ProfileComplete());
     } else{
       isLoading=false;
       ApplicationUtils.showSnackBar(
           titleText: _addConsent?.status, messageText: _addConsent?.msg);
     }

   }catch(e){
     isLoading = false;
     debugPrint('Error Catch : ${e.toString()}');
     ApplicationUtils.showSnackBar(
         titleText: "Error", messageText: 'Something went wrong.Try again');
   }
update();
  }

  onChangeValue(String value) {
    dropDownValue = value;
    if (dropDownValue == "Select a choice..") {
      dropDownValue = "Select a choice..";
    } else if (dropDownValue == "1") {
      dropDownValue = "1";
    } else if (dropDownValue == '2') {
      dropDownValue = "2";
    } else {
      dropDownValue = "3";
    }
    update();
  }

  selectedValueL1(value,index) {
    selectValueL1 = value;

    if (selectedIndexesL1.contains(index) ) {
      selectedIndexesL1.remove(index);   // unselect
    }else if(index==2){
      selectedIndexesL1.clear();
      selectedIndexesL1.add(index);
    }
    else if(selectedIndexesL1.contains(2) == false){
      selectedIndexesL1.add(index);  // select
    }


        //  else if (selectValueL1 == "Marijuana") {
   //    isMarijuana =  true;
   //    //select_list1_value = "Marijuana";
   //  } else {
   //    select_list1_value = "None of these";
   //    //noOfThese1=true;
   //
   //  }
    update();
  }

  selectedValueL2(value,index) {
    selectValueL2 = value;
    if (selectedIndexesL2.contains(index)) {
      selectedIndexesL2.remove(index);   // unselect
    }else if(index == 3){
      selectedIndexesL2.clear();
      selectedIndexesL2.add(index);
    }
    else if(selectedIndexesL2.contains(3)==false){
      selectedIndexesL2.add(index);  // select
    }
    // if (selectValueL2 == "Narcotics") {
    //   select_list2_value = "Narcotics";
    //
    //   isNarcotics = true;
    // } else if (selectValueL2 == "Amphetamines") {
    //   isAmphetamine=true;
    //   select_list2_value = "Amphetamines";
    // } else if (selectValueL2 == "Cocaine") {
    //   select_list2_value = "Cocaine";
    // } else {
    //   select_list2_value = "None of these";
    // }
    update();
  }

  void confirmDiabetes(value) {
    haveDiabetes = value;
    if (haveDiabetes == "yes") {
      diabetesYes = true;
      diabetesNo = false;
      isDiabetic=true;
    } else if (haveDiabetes == "no") {
      diabetesNo = true;
      diabetesYes = false;
      isDiabetic=false;
    }
    update();
  }

  void dateTimeChanged(value) {
    selectDate = value;
    String formatedDate = DateFormat('yyyy-MM-dd').format(selectDate);
    dob=formatedDate;
    update();
  }

  void selectGender(value) {
    select_gender = value;
    if (select_gender == "male") {
      print(select_gender);
      isMale = true;
      isFemale = false;
    } else if (select_gender == "Female") {
      print(select_gender);
      isFemale = true;
      isMale = false;
    }
    update();
  }




  @override
  void onInit() {
    // TODO: implement onInit
    feetController = TextEditingController();
    inchesController = TextEditingController();
    allergiesController = TextEditingController();
    poundsController = TextEditingController();
    medicalConditionsController = TextEditingController();
    currentMedicationsController = TextEditingController();
    page3FormKey = GlobalKey<FormState>();
    page2FormKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    feetController.dispose();
    allergiesController.dispose();
    inchesController.dispose();
    poundsController.dispose();
    medicalConditionsController.dispose();
    currentMedicationsController.dispose();
  }
}
