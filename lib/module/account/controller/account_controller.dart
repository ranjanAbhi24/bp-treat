import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final Prefrence _prefs = Prefrence();

  bool isLoading = false;

  logout() async {
    isLoading = true;
    bool isCleared = await _prefs.clearData();
    if (isCleared) {
      isLoading = false;
      Get.offAll(() => const LoginScreen());
    }
    update();
  }
}
