import 'package:bp_treat/module/account/model/health_detail.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HealthDetailController extends GetxController {
  final ApiService _apiService = ApiService();
  HealthDetail? _patientDetails;
  HealthDetail? get patientDetail => _patientDetails;

  HealthDetail? _updatedUser;
  HealthDetail? get updateUser => _updatedUser;

  late TextEditingController systolicController;
  late TextEditingController diastolicController;
  late TextEditingController pulseController;
  late TextEditingController otherDiseaseController;
  late TextEditingController medicationController;
  late TextEditingController allergiesController;
  late TextEditingController hematocritController;
  late TextEditingController creatinineController;
  late TextEditingController calciumController;
  late TextEditingController albuminController;
  late TextEditingController tshController;
  late GlobalKey<FormState> formKey;
  List<String> listOfOption = ['Yes', 'No'];
  //List<String> alcoholOption = ['0/day', '1/day', '2/day','3/day' ,'more than 3/day'];
  List<String> alcoholOption = ["0/day", "1/day", '2/day', "3/day","more than 3/day"];

  bool? isHeroin = false;
  String? heroineValue = 'No';

  String? alcoholic = '0/day';

  String? diabetes = 'No';
  bool? isDiabetic = false;

  String? narcotics = 'No';
  bool? isNarcotics = false;

  String? tabacoo = 'No';
  bool? isTabacoo = false;

  String? marijuana = 'No';
  bool? isMarijuana = false;

  String? amphetamineValue = 'No';
  bool? isAmphetamine = false;

  bool isLoading = false;

  onHeroin(String? value) {
    heroineValue = value;
    if (heroineValue == "Yes") {
      isHeroin = true;
    } else {
      isHeroin = false;
    }
    update();
  }

  onSmoke(String? value) {
    tabacoo = value;
    if (tabacoo == "Yes") {
      isTabacoo = true;
    } else {
      isTabacoo = false;
    }
    update();
  }

  onWeed(String? value) {
    marijuana = value;
    if (marijuana == "Yes") {
      isMarijuana = true;
    } else {
      isMarijuana = false;
    }
    update();
  }

  onAlcoholicChange(String? value) {
    alcoholic = value;
   // alcoholic = value;
    if (alcoholic == "0/day") {
      alcoholic = "0/day";
    } else if (alcoholic == "1/day") {
      alcoholic = "1/day";
    } else if (alcoholic == '2/day') {
      alcoholic = "2/day";
    } else if(alcoholic == '3/day'){
      alcoholic = "3/day";
    }
    else {
      alcoholic= "more than 3/day";
    }
    update();
    debugPrint('$alcoholic || $value');

  }

  onNarcotics(String? value) {
    narcotics = value;
    if (narcotics == "Yes") {
      isNarcotics = true;
    } else {
      isNarcotics = false;
    }
    update();
  }

  onDiabetes(String? value) {
    diabetes = value;
    if (diabetes == "Yes") {
      isDiabetic = true;
    } else {
      isDiabetic = false;
    }
    update();
  }

  onAmphetamine(String? value) {
    amphetamineValue = value;
    if (amphetamineValue == "Yes") {
      isAmphetamine = true;
    } else {
      isAmphetamine = false;
    }
    update();
  }

  fetchHealthDetail() async {
    try {
      isLoading = true;
      _patientDetails = await _apiService.getPatientDetail();
      if (_patientDetails?.status == "Success") {

        isLoading = false;
        isDiabetic = _patientDetails?.health?.diabetes ?? false;
        otherDiseaseController.text =
            _patientDetails?.health?.otherDiseases ?? "";
        medicationController.text = _patientDetails?.health?.medication ?? "";
        allergiesController.text = _patientDetails?.health?.allergies ?? "";
        isTabacoo=_patientDetails?.health?.smoker;
        isMarijuana=_patientDetails?.health?.marijuana;

        isNarcotics = _patientDetails?.health?.narcotics ?? false;
        alcoholic = _patientDetails?.health?.alcohol;
        isAmphetamine = _patientDetails?.health?.amphetamine ?? false;

      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _patientDetails?.status,
            messageText: _patientDetails?.msg);
      }
    } catch (e) {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: 'Error',
          messageText: 'Somthing went wrong.Please try again');
    }

    update();
  }

  updateHealthDetails() async {
    try {
      isLoading = true;
      _updatedUser = await _apiService.updatePatientDetail(

        allergic: allergiesController.text,
        calcium: calciumController.text,
        creatanine: creatinineController.text,
        hematocrit: hematocritController.text,
        alcoholic: alcoholic,
        isAmphetamine: isAmphetamine,
        isDiabetic: isDiabetic,

        isNarcotics: isNarcotics,
        medication: medicationController.text,
        otherDisease: otherDiseaseController.text,

        isSmoker: isTabacoo,
        isWeedUser: isMarijuana,
      );
      if (_updatedUser?.status == "Success") {
        isLoading = false;
        Get.off(() => const LandingPage());
        ApplicationUtils.showSnackBar(
            titleText: _updatedUser?.status, messageText: _updatedUser?.msg);
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: _updatedUser?.status, messageText: _updatedUser?.msg);
      }
    } catch (e) {
      isLoading = false;
      debugPrint('Error catch block $e');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchHealthDetail();
    systolicController = TextEditingController();
    diastolicController = TextEditingController();
    pulseController = TextEditingController();
    otherDiseaseController = TextEditingController();
    medicationController = TextEditingController();
    allergiesController = TextEditingController();
    hematocritController = TextEditingController();
    calciumController = TextEditingController();
    creatinineController = TextEditingController();
    albuminController = TextEditingController();
    tshController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    systolicController.dispose();
    diastolicController.dispose();
    pulseController.dispose();
    otherDiseaseController.dispose();
    medicationController.dispose();
    allergiesController.dispose();
    hematocritController.dispose();
    calciumController.dispose();
    creatinineController.dispose();
    albuminController.dispose();
    tshController.dispose();
  }
}
