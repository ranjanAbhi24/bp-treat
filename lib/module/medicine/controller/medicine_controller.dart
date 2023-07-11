import 'dart:async';
import 'dart:io';
import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/medicine/model/medicine.dart';
import 'package:bp_treat/module/medicine/model/prescribtion_status.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class MedicineController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence.instance;
  MedicineReport? _report;
  MedicineReport? get report => _report;
  User? _userData;
  User? get userData => _userData;

  final List<Report> _reportList = [];
  List<Report> get reportList => _reportList;
  PrescribtionStatus? _prescrbtionStatus;
  PrescribtionStatus? get prescStatus => _prescrbtionStatus;
  bool isLoading = false;
  String? prescriptionID;

  getUserPrecription() async {
    isLoading = true;
    final patientID = Get.find<LandingController>().userInfo['data']['_id'];

    _report = await _apiService.fetchPrescribtion(patientID);

    if (_report?.status == "Success") {
      isLoading = false;
      _reportList.addAll(_report?.report ?? []);
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: _report?.status, messageText: _report?.msg);
    }
    update();
  }

  prescribtionStatus(String prescriptioID) async {
    isLoading = true;
    _prescrbtionStatus =
        await _apiService.changePrescriptionStatus(prescriptioID);

    if (_prescrbtionStatus?.status == "Success") {
      isLoading = false;
      await getUserPrecription();
      ApplicationUtils.showSnackBar(
          titleText: 'Report Downloaded', messageText: _prescrbtionStatus?.msg);
    } else {
      isLoading = false;
      ApplicationUtils.showSnackBar(
          titleText: _prescrbtionStatus?.status,
          messageText: _prescrbtionStatus?.msg);
    }
    update();
  }

  Future<File> downloadPDF({
    required String url,
    required String fileName,
  }) async {
    try {
      isLoading = true;
      final status = await Permission.storage.request();
      if (status.isGranted) {
        isLoading = false;
        final token = _prefs.getToken();
        final response = await http.get(Uri.parse(url), headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",
          "Authorization": 'Bearer $token',
        });

        if (response.statusCode == 200) {
          isLoading = false;
          final bytes = response.bodyBytes;
          final appDocDir = Platform.isAndroid
              ? Directory('/storage/emulated/0/Download')
              : await getApplicationDocumentsDirectory();

          final pdfFile = File('${appDocDir.path}/$fileName');
          await pdfFile.writeAsBytes(bytes);
          return pdfFile;
        } else {
          isLoading = false;

          throw Exception('Exception => ${response.statusCode}');
        }
      } else {
        isLoading = false;
        await Permission.storage.request();
        throw Exception('Request for permission');
      }
    } catch (e) {
      isLoading = false;
      throw Exception('Exception => $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserPrecription();
  }
}
