import 'package:bp_treat/module/contact/controller/contact_controller.dart';
import 'package:get/instance_manager.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
