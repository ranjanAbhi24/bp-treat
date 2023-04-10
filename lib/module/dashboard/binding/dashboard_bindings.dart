import 'package:bp_treat/module/dashboard/controller/add_bp_controller.dart';
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:bp_treat/module/dashboard/controller/view_all_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<AddBPController>(() => AddBPController());
    Get.lazyPut<ViewAllController>(() => ViewAllController());
  }
}
