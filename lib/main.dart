import 'dart:io';
// import 'package:bp_treat/module/consult/view/first_consent_form.dart';
import 'package:bp_treat/module/dashboard/binding/root_binding.dart';
import 'package:bp_treat/module/welcome/views/wrapper_view.dart';
import 'package:bp_treat/route/app_route.dart';
import 'package:bp_treat/service/notification_service.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefrence.instance.init();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBwKaJgWtthEzuS_nKpRDjPnEoySrOA8Xk",
      appId: "1:588499290984:ios:7cd551b042c5fc13d0e4dd",
      messagingSenderId: "588499290984",
      projectId: "bp-treat-83199",
    ));
  } else {
    await Firebase.initializeApp();
  }
  await NotificationService().initialize();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      builder: (context,child) {
        return  GetMaterialApp(
          home: child,
              //Wrapper();
          // home: OTPScreen(),
          debugShowCheckedModeBanner: false,
          initialBinding: RootBindings(),
          builder: EasyLoading.init(),
          theme: themeData(),
          defaultTransition: Transition.fade,
          getPages: AppRoute.routes,
        );
      },
      child: const Wrapper(),
    );
  }
}
