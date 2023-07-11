import 'package:bp_treat/module/account/controller/account_controller.dart';
import 'package:bp_treat/module/contact/controller/contact_controller.dart';
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/medicine/controller/medicine_controller.dart';
import 'package:get/get.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LandingController>(LandingController(), permanent: true);
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<MedicineController>(() => MedicineController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
