import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefrence {
  SharedPreferences? _prefs;
  Prefrence._privateConstructor();

  static final Prefrence instance = Prefrence._privateConstructor();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> getSharedPreferencesInstance() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs = await SharedPreferences.getInstance().catchError((e) {
      debugPrint('prefrence Error : $e');
    });
    return true;
  }

  Future  setDoctorDetails(String value) async {
    await _prefs!.setString('drDetails', value);

  }



  Future setToken(String? token) async {
    await _prefs!.setString('token', token!);
  }

  String getToken() {
    String? getToken = _prefs!.getString('token');
    debugPrint(getToken);
    return getToken ?? "";
  }

  Future<bool> setFCMToken(String fcmToken) async {
    bool isTrue = await _prefs!.setString('fcm', fcmToken);
    return isTrue;
  }

  String getFCMToken() {
    String? fcm = _prefs!.getString('fcm');
    debugPrint("fcm $fcm");
    return fcm ?? "no fcm found";
  }

  Future<bool> setBadgeStatus(bool badge) async {
    bool status = await _prefs!.setBool('badgeStatus', badge);
    return status;
  }

  getBadgStatus() {
    bool? status = _prefs!.getBool('badgeStatus');
    return status ?? false;
  }

  Future<bool> setUserDetails(String value) async {
    bool? userData = await _prefs!.setString("userDetails", value);
    return userData;
  }

  String? getUserDetails() {
    String? user = _prefs!.getString("userDetails");


    return user??'';
  }

  Future<bool> clearData() async {
    await _prefs!.clear();
    return true;
  }
}
