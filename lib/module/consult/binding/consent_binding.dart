import 'package:bp_treat/module/consult/controller/consent_controller.dart';
import 'package:get/get.dart';

class ConsentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsentController>(() => ConsentController());
  }
}
