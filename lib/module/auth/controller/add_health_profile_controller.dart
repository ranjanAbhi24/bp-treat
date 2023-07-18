import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHealthController extends GetxController {
  bool isMale = false;
  bool isFemale = false;
  DateTime selectDate = DateTime.now();
  late TextEditingController feetController;
  late TextEditingController inchesController;
  late TextEditingController allergiesController;
  late TextEditingController poundsController;
  late TextEditingController medicalConditionsController;
  late TextEditingController currentMedicationsController;
  late GlobalKey<FormState> page2FormKey;
  String select_gender = 'male';

  String haveDiabetes = "Yes";
  bool diabetesYes = false;
  bool diabetesNo = false;
  List<String> dropdownList = ["Select a choice..", "1", '2', "3"];
  List<String> list1 = ['Tabacco', 'Marijuana', 'None of these'];
  String selectValueL1 = '';
  String selectValueL2 = '';
  String select_list1_value = "";
  String select_list2_value = '';
  List<String> list2 = [
    'Narcotics',
    'Amphetamines',
    'Cocaine',
    'None of these'
  ];

  String dropDownValue = 'Select a choice..';

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

  selectedValueL1(value) {
    selectValueL1 = value;
    if (selectValueL1 == "Tabacco") {
      // tabacco = true;
      select_list1_value = "Tabacco";
    } else if (selectValueL1 == "Marijuana") {
      //marijuana =  true;
      select_list1_value = "Marijuana";
    } else {
      select_list1_value = "None of these";
      //noOfThese1=true;
    }
    update();
  }

  selectedValueL2(value) {
    selectValueL2 = value;
    if (selectValueL2 == "Narcotics") {
      select_list2_value = "Narcotics";
    } else if (selectValueL2 == "Amphetamines") {
      select_list2_value = "Amphetamines";
    } else if (selectValueL2 == "Cocaine") {
      select_list2_value = "Cocaine";
    } else {
      select_list2_value = "None of these";
    }
    update();
  }

  void confirmDiabetes(value) {
    haveDiabetes = value;
    if (haveDiabetes == "yes") {
      diabetesYes = true;
      diabetesNo = false;
    } else if (haveDiabetes == "no") {
      diabetesNo = true;
      diabetesYes = false;
    }
    update();
  }

  void dateTimeChanged(value) {
    selectDate = value;
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
