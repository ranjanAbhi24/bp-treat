import 'package:bp_treat/module/account/controller/account_controller.dart';
import 'package:bp_treat/module/contact/controller/contact_controller.dart';
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/medicine/controller/medicine_controller.dart';
import 'package:get/get.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<MedicineController>(() => MedicineController(), fenix: true);
    Get.lazyPut<ContactController>(() => ContactController(), fenix: true);
    Get.lazyPut<AccountController>(() => AccountController(), fenix: true);
  }
}
