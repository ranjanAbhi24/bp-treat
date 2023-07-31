import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final Prefrence _prefs = Prefrence.instance;

  bool isLoading = false;
  dynamic docInfo;

  logout() async {
    isLoading = true;
    bool isCleared = await _prefs.clearData();
    if (isCleared) {
      isLoading = false;
      Get.find<LandingController>().tabIndex=0;
      Get.offAll(() => const LoginScreen());
    //  Get.until((route) => Get.currentRoute == const LoginScreen());
    }
    update();
  }


}
