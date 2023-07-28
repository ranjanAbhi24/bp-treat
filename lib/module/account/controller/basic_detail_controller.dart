import 'package:bp_treat/module/account/model/update_user.dart';
import 'package:bp_treat/module/account/model/user_detail.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/extension.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicDetailController extends GetxController {
  final ApiService _apiService = ApiService();
  UserDetail? _userData;
  UserDetail? get userData => _userData;
  TimeOfDay time = const TimeOfDay(hour: 09, minute: 00);
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileNumberController;
  late TextEditingController stateController;
  late TextEditingController zipCodeController;
  late TextEditingController dobController;
  late TextEditingController genderController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController timeController;
  late GlobalKey<FormState> formKey;
  UpdatedUser? updatedData;
  bool isLoading = false;

  List<String> genderType = ["Male", "Female"];

  showTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (newTime == null) {
      return;
    } else {
      final replaceTime = newTime.to24hours();
      timeController.text = replaceTime;
    }
    update();
  }

  userDetail() async {
    try {
      isLoading = true;
      _userData = await _apiService.getUserDetails();

      nameController.text = _userData?.data?.name ?? "name";
      emailController.text = _userData?.data?.email ?? "email";
      dobController.text = _userData?.data?.dob ?? "dob";
      mobileNumberController.text = _userData?.data?.mobile ?? "mobile";
      stateController.text = _userData?.data?.state ?? "state";
      zipCodeController.text = _userData!.data!.zipcode.toString();
      genderController.text = _userData?.data?.gender ?? "gender";
      weightController.text = _userData!.data!.weight.toString();
      heightController.text = _userData!.data!.height.toString();
      timeController.text = _userData!.data?.notificationTime ?? '09:00';
      isLoading = false;
    } catch (e) {
      ApplicationUtils.showSnackBar(
          titleText: _userData?.status ?? "",
          messageText: _userData?.msg ?? "");
      isLoading = false;
    }
    update();
  }

  updateDetail() async {
    try {
      isLoading = true;
      updatedData = await _apiService.updateUserRecord(
        weight: weightController.text,
        time: timeController.text,
      );
      if (updatedData?.status == "Success") {
        isLoading = false;

        Get.back();
        ApplicationUtils.showSnackBar(
            titleText: updatedData?.status, messageText: updatedData?.msg);
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: updatedData?.status, messageText: updatedData?.msg);
      }
    } catch (e) {
      isLoading = false;
      debugPrint("CatchError : ${e.toString()}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    userDetail();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileNumberController = TextEditingController();
    stateController = TextEditingController();
    zipCodeController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    timeController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    dobController.dispose();
    genderController.dispose();
    heightController.dispose();
    weightController.dispose();
    timeController.dispose();
  }
}
