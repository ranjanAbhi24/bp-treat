import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/model/all_record.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:get/get.dart';

class ViewAllController extends GetxController {
  final ApiService _apiService = ApiService();

  AllRecord? _viewAllRecord;
  AllRecord? get viewAllRecord => _viewAllRecord;

  User? _user;
  User? get userData => _user;
  final List<Listrecord> _listOfRecord = [];
  List<Listrecord> get list => _listOfRecord;
  int page = 1;
  int limit = 6;
  String? patientID;
  bool hasMore = true;
  bool isLoading = false;
  int isSelected = (0);
  String selectedInterval = 'hour';
  String interval = 'hour';
  List<String> intervals = ["24hr", "Weekly", "Monthly", "Yearly"];

  viewAll() async {
    isLoading = true;
    patientID = Get.find<LandingController>().userDetail?.data?.id;
    _viewAllRecord = await _apiService.viewAllRecord(
        intervals: interval, patientID: patientID ?? "");
    if (_viewAllRecord?.status == "Success") {
      isLoading = false;
      _listOfRecord.assignAll(_viewAllRecord?.records?.listrecord ?? []);
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: 'Error', messageText: _viewAllRecord?.msg ?? "Errror");
    }
    update();
  }

  onIntervalTap(int index, String value) async {
    isSelected = index;
    selectedInterval = value;
    if (selectedInterval == "24hr") {
      interval = "hour";
    } else if (selectedInterval == "Weekly") {
      interval = "week";
    } else if (selectedInterval == "Monthly") {
      interval = 'month';
    } else {
      interval = 'year';
    }
    await viewAll();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    viewAll();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
