import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';
import 'package:get/get.dart';

class ConsentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddHealthController>(() => AddHealthController());
  }
}
