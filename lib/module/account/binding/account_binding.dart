import 'package:bp_treat/module/account/controller/basic_detail_controller.dart';
import 'package:bp_treat/module/account/controller/faq_controller.dart';
import 'package:bp_treat/module/account/controller/health_detail_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicDetailController>(() => BasicDetailController());
    Get.lazyPut<FAQController>(() => FAQController());
    Get.lazyPut<HealthDetailController>(() => HealthDetailController());
  }
}
