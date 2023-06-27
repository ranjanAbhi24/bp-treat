import 'dart:convert';

import 'package:bp_treat/module/consult/model/add_consent.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConsentController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence();

  AddConsent? _addConsent;
  AddConsent? get consent => _addConsent;

  late TextEditingController dobController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController phoneController;
  late TextEditingController stateController;
  late TextEditingController zipController;
  late TextEditingController pulseController;
  late TextEditingController genderController;
  late TextEditingController otherMedicationController;
  late TextEditingController allergyController;
  late TextEditingController hematocritController;
  late TextEditingController creatinineController;
  late TextEditingController calciumController;
  late TextEditingController albuminController;
  late TextEditingController otherDisease;
  late TextEditingController diseaseController;
  late TextEditingController tshController;
  late GlobalKey<FormState> formKey;

  List<String> gender = [
    'Male',
    'Female',
  ];
  List<String> userValue = ['Yes', 'No'];
  List<String> alcoholOption = ['0/day', '1/day', '2/day', 'more than 2/day'];
  String? genderValue = 'Male';
  String? diabetic = 'No';
  bool? isDiabetic = false;
  String? smoker = 'No';
  bool? isSmoker = false;
  String? weedUser = 'No';
  bool? isWeedSmoker = false;
  String? amphetamine = 'No';
  bool? isAmphetamine = false;
  String? narcotics = 'No';
  bool? isNarcotics = false;
  String? alcoholic = '0/day';

  String? heroine = 'No';
  bool? isHeroine = false;

  DateTime startDate = DateTime.now();

  bool isLoading = false;
  bool? ischecked = false;

  isDiabeties(String? val) {
    diabetic = val;
    if (diabetic == 'Yes') {
      isDiabetic = true;
    } else {
      isDiabetic = false;
    }
    update();
  }

  onSmoking(String? value) {
    smoker = value;
    if (smoker == 'Yes') {
      isSmoker = true;
    } else {
      isSmoker = false;
    }
    update();
  }

  isWeed(String? value) {
    weedUser = value;
    if (weedUser == "Yes") {
      isWeedSmoker = true;
    } else {
      isWeedSmoker = false;
    }
    update();
  }

  isAmphetamin(String? value) {
    amphetamine = value;
    if (amphetamine == 'Yes') {
      isAmphetamine = true;
    } else {
      isAmphetamine = false;
    }
    update();
  }

  isNarcotic(String? value) {
    narcotics = value;
    if (narcotics == 'Yes') {
      isNarcotics = true;
    } else {
      isNarcotics = false;
    }
    update();
  }

  onHeroine(String? value) {
    heroine = value;
    if (heroine == 'Yes') {
      isHeroine = true;
    } else {
      isHeroine = false;
    }
    update();
  }

  onAlcoholicChange(String? value) {
    alcoholic = value;
    print('$alcoholic || $value');
    update();
  }

  onGenderChange(String? value) {
    genderValue = value;
    update();
  }

  // toggleCheckBox(bool? value) async {
  //   ischecked = value;
  //   if (value == true) {
  //     print("if : $ischecked");
  //     await _prefs.setConsent(ischecked);
  //   } else {
  //     print("else: $ischecked");

  //     await _prefs.setConsent(ischecked);
  //   }
  //   update();
  // }

  selectDOB(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      fieldHintText: 'Select Date',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF8CE7F1),
            colorScheme: ColorScheme.light(primary: kPrimaryColor!),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      if (!pickedDate.isAfter(DateTime.now())) {
        String formatedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        return dobController.text = formatedDate;
      } else {
        return ApplicationUtils.showSnackBar(
            titleText: 'Error', messageText: 'Please enter a valid DOB');
      }
    }
  }

  postConsent() async {
    try {
      isLoading = true;
      _addConsent = await _apiService.addPatientConsent(
        dateOfBirth: dobController.text,
        gender: genderValue,
        height: heightController.text,
        weight: weightController.text,
        isDiabetic: isDiabetic,
        alcohol: alcoholic,
        albumin: albuminController.text,
        calcium: calciumController.text,
        allergies: allergyController.text,
        creatinine: creatinineController.text,
        hematocrit: hematocritController.text,
        isAmphetamine: isAmphetamine,
        isConsent: true,
        isMarijuana: isWeedSmoker,
        isNarcotics: isNarcotics,
        isSmoker: isSmoker,
        tsh: tshController.text,
        medication: otherMedicationController.text,
        otherDisease: otherDisease.text,
        isHeroine: isHeroine,
        mobile: phoneController.text,
        state: stateController.text,
        zipcode: int.parse(zipController.text),
      );
      debugPrint("Consent : ${_addConsent?.status}");
      debugPrint("Consent : ${_addConsent?.msg}");

      if (_addConsent?.status == "Success") {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _addConsent?.status, messageText: _addConsent?.msg);
        // await _prefs.setConsent(_addConsent?.consent?.consultationConsent);
        await _prefs.setUserDetails(jsonEncode(_addConsent?.consent));
        // Get.find<LandingController>().getUserDetails();
        Get.off(() => const LandingPage());
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _addConsent?.status, messageText: _addConsent?.msg);
      }
    } catch (e) {
      isLoading = false;
      debugPrint('Error Catch : ${e.toString()}');
      ApplicationUtils.showSnackBar(
          titleText: "Error", messageText: 'Somthing went wrong.Try again');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    genderController = TextEditingController();
    dobController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    phoneController = TextEditingController();
    stateController = TextEditingController();
    zipController = TextEditingController();
    pulseController = TextEditingController();
    otherMedicationController = TextEditingController();
    allergyController = TextEditingController();
    albuminController = TextEditingController();
    creatinineController = TextEditingController();
    calciumController = TextEditingController();
    hematocritController = TextEditingController();
    otherDisease = TextEditingController();
    diseaseController = TextEditingController();
    tshController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    dobController.dispose();
    heightController.dispose();
    weightController.dispose();
    phoneController.dispose();
    stateController.dispose();
    zipController.dispose();
    pulseController.dispose();
    otherMedicationController.dispose();
    allergyController.dispose();
    otherDisease.dispose();
    diseaseController.dispose();
    calciumController.dispose();
    hematocritController.dispose();
    albuminController.dispose();
    creatinineController.dispose();
    calciumController.dispose();
    tshController.dispose();
  }
}
