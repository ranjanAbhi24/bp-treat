import 'package:bp_treat/module/doctor/controller/doctor_controller.dart';
import 'package:get/instance_manager.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorController>(() => DoctorController(), fenix: true);
  }
}
