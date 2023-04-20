import 'dart:async';
import 'dart:io' as platform;
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
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class MedicineController extends GetxController {
  final ApiService _apiService = ApiService();
  final Prefrence _prefs = Prefrence();
  MedicineReport? _report;
  MedicineReport? get report => _report;
  User? _userData;
  User? get userData => _userData;

  final List<Report> _reportList = [];
  List<Report> get reportList => _reportList;
  PrescribtionStatus? _prescrbtionStatus;
  PrescribtionStatus? get prescStatus => _prescrbtionStatus;
  bool isLoading = false;
  final ReceivePort _port = ReceivePort();
  List<DownloadTask>? _tasks;

  String? prescriptionID;
  late String _localPath;

  // getMedicineName(String medicineName) async {
  //   var result = medicineName.contains('name');
  //   print("result :$result");
  //   update();
  // }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
          print('Dir : $appDocDir');
          final pdfFile = File('${appDocDir.path}/$fileName');
          await pdfFile.writeAsBytes(bytes);
          return pdfFile;
        } else {
          isLoading = false;
          print('else block');
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

  Future showNotificationWithdefaultSound() async {
    var androidPlatformChannelSpecifies = const AndroidNotificationDetails(
      "high_importance_channel",
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosPlatformChannelSpecifies = const DarwinNotificationDetails();
    var platoformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifies,
        iOS: iosPlatformChannelSpecifies);
    await flutterLocalNotificationsPlugin.show(0, 'Prescription Downloaded',
        'Your Prescription has been download', platoformChannelSpecifics,
        payload: 'Default_Sound');
  }
  // Future<void> downloadPDF(
  //     {required String url, required String fileName}) async {
  //   try {
  //     var token = await _prefs.getToken();
  //     isLoading = true;
  //     // PermissionStatus status = await Permission.storage.status;
  //     // // openAppSettings();
  //     // if (!status.isGranted) {
  //     //   status = await Permission.storage.request();
  //     //   if (!status.isGranted) {
  //     //     throw Exception('Storage permission not granted');
  //     //   }
  //     //   isLoading = false;
  //     //   // final directory = Platform.isAndroid
  //     //   //     ? await getExternalStorageDirectory()
  //     //   //     : await getApplicationDocumentsDirectory();
  //     //   // final filePath = '${directory!.path}/$fileName';
  //     //   // print('FilePath : $filePath');
  //     //   // print('Directory : $directory');
  //     //   await _prepareSaveDir();
  //     //   final taskID = await FlutterDownloader.enqueue(
  //     //     url: url,
  //     //     savedDir: _localPath,
  //     //     fileName: fileName,
  //     //     showNotification: true,
  //     //     openFileFromNotification: true,
  //     //   );
  //     final status = await Permission.mediaLibrary.request();
  //     print(status);
  //     if (status.isGranted) {
  //       isLoading = false;
  //       // final dir = await getExternalStorageDirectory();
  //       // debugPrint("Dir : $dir");
  //       await _prepareSaveDir();
  //       String? taskID = await FlutterDownloader.enqueue(
  //         saveInPublicStorage: true,
  //         url: url,
  //         fileName: fileName,
  //         // savedDir: dir!.path,
  //         savedDir: _localPath,
  //         headers: {
  //           'Content-type': 'application/json',
  //           'Accept': 'application/json',
  //           "Access-Control-Allow-Origin": "*",
  //           "Authorization": 'Bearer $token',
  //         },
  //         showNotification: true,
  //         openFileFromNotification: true,
  //       );
  //       debugPrint("TaskID : $taskID");
  //     } else {
  //       isLoading = false;
  //       ApplicationUtils.showSnackBar(
  //           titleText: 'Denied', messageText: 'Permission Denied');
  //     }
  //   } catch (e) {
  //     print('catch error');
  //     debugPrint(e.toString());
  //   }
  //   update();
  // }

  // Future<void> _prepareSaveDir() async {
  //   _localPath = (await _getSavedDir())!;
  //   final savedDir = Directory(_localPath);
  //   if (!savedDir.existsSync()) {
  //     await savedDir.create();
  //   }
  // }

  // Future<String?> _getSavedDir() async {
  //   String? externalStorageDirPath;

  //   if (Platform.isAndroid) {
  //     try {
  //       externalStorageDirPath = await AndroidPathProvider.downloadsPath;
  //     } catch (err, st) {
  //       print('failed to get downloads path: $err, $st');

  //       final directory = await getExternalStorageDirectory();
  //       externalStorageDirPath = directory?.path;
  //     }
  //   } else if (Platform.isIOS) {
  //     externalStorageDirPath =
  //         (await getApplicationDocumentsDirectory()).absolute.path;
  //     print(externalStorageDirPath);
  //   }
  //   return externalStorageDirPath;
  // }

  // @pragma('vm:entry-point')
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port')!;
  //   send.send([id, status, progress]);
  // }
  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserPrecription();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // IsolateNameServer.registerPortWithName(
    //     _port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   String id = data[0];
    //   DownloadTaskStatus status = data[1];
    //   int progress = data[2];
    //   update();
    // });

    // FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    // IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }
}
