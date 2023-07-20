
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProfileController extends GetxController{
  late TextEditingController phoneNumberController;
  late TextEditingController zipCodeController;
  late GlobalKey<FormState> profileFormKey;


  @override
  void onInit() {

    phoneNumberController= TextEditingController();
    zipCodeController=TextEditingController();
    profileFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberController= TextEditingController();
    zipCodeController=TextEditingController();
    super.dispose();
  }
}