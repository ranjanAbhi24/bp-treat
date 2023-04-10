import 'package:bp_treat/module/account/model/faq.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:get/get.dart';

class FAQController extends GetxController {
  final ApiService _apiService = ApiService();
  FAQ? _faq;
  FAQ? get faq => _faq;
  bool isLoading = false;

  getFAQ() async {
    isLoading = true;
    _faq = await _apiService.fetchFAQ();
    if (_faq?.status == "Success") {
      isLoading = false;
      _faq;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getFAQ();
  }
}
