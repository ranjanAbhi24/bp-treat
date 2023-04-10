import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/medicine/model/medicine.dart';
import 'package:bp_treat/module/medicine/model/prescribtion_status.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MedicineController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence();
  MedicineReport? _report;
  MedicineReport? get report => _report;
  User? _userData;
  User? get userData => _userData;

  late String _localPath;

  final List<Report> _reportList = [];
  List<Report> get reportList => _reportList;
  PrescribtionStatus? _prescrbtionStatus;
  PrescribtionStatus? get prescStatus => _prescrbtionStatus;
  bool isLoading = false;
  final ReceivePort _port = ReceivePort();
  List<DownloadTask>? _tasks;

  String? prescriptionID;

  // getMedicineName(String medicineName) async {
  //   var result = medicineName.contains('name');
  //   print("result :$result");
  //   update();
  // }

  getUserPrecription() async {
    isLoading = true;
    _report = await _apiService.fetchPrescribtion(
        Get.find<LandingController>().userData?.data?.sId ?? "");
    if (_report?.status == "Success") {
      isLoading = false;
      _reportList.assignAll(_report?.report ?? []);
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
          titleText: 'Error', messageText: _prescrbtionStatus?.msg);
    }
    update();
  }

  Future<void> requestDownload({
    required String url,
    required String fileName,
    required String id,
  }) async {
    var token = await _prefs.getToken();
    try {
      isLoading = true;
      final status = await Permission.storage.request();
      if (status.isGranted) {
        isLoading = false;
        // final dir = await getExternalStorageDirectory();
        // debugPrint("Dir : $dir");
        await _prepareSaveDir();
        String? taskId = await FlutterDownloader.enqueue(
          saveInPublicStorage: true,
          url: url,
          fileName: fileName,
          // savedDir: dir!.path,
          savedDir: _localPath,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            "Access-Control-Allow-Origin": "*",
            "Authorization": 'Bearer $token',
          },
          showNotification: true,
          openFileFromNotification: true,
        );

        await prescribtionStatus(id);
        debugPrint("TaskID : $taskId");
      } else {
        isLoading = false;
        ApplicationUtils.showSnackBar(
            titleText: 'Denied', messageText: 'Permission Denied');
      }
    } catch (e) {
      isLoading = false;
      debugPrint("catch $e");
    }
    update();
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _getSavedDir())!;
    final savedDir = Directory(_localPath);
    if (!savedDir.existsSync()) {
      await savedDir.create();
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (err, st) {
        print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  void bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      unbindBackgroundIsolate();
      bindBackgroundIsolate();
      return;
    }
    _port.listen((data) {
      print('Dataaaa : $data');
      final taskId = (data as List<dynamic>)[0] as String;
      final statuss = data[1] as DownloadTaskStatus;
      final progress = data[2] as int;

      if (_tasks != null && _tasks!.isNotEmpty) {
        final tasks = _tasks!.firstWhere((task) => task.taskId == taskId);
        print('taskkkkk : $tasks');
        // tasks
        //   ..status = statuss
        //   ..progress = progress;
      }
    });
    update();
  }

  void unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  void onInit() {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      log("Dataaa : $data");
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (status == DownloadTaskStatus.complete) {
        log('Download Complete');
        ApplicationUtils.showSnackBar(
            titleText: 'Report Downloaded',
            messageText: _prescrbtionStatus?.msg);
      } else {
        ApplicationUtils.showSnackBar(
            titleText: 'Failed', messageText: status.toString());
        log("status : ${status.toString()}");
        log("Prog : ${progress.toString()}");
        log("Else Dataaa : $data");
      }
      update();
    });

    getUserPrecription();
    FlutterDownloader.registerCallback(downloadCallback);
    // FlutterDownloader.registerCallback(downloadCallback, step: 1);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
