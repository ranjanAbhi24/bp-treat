import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefrence {
  SharedPreferences? _prefs;

  Future<bool> getSharedPreferencesInstance() async {
    _prefs = await SharedPreferences.getInstance().catchError((e) {
      debugPrint('prefrence Error : $e');
    });
    return true;
  }

  static setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
  }

  Future<String> getToken() async {
    _prefs = await SharedPreferences.getInstance();
    String? getToken = _prefs!.getString('token');
    debugPrint(getToken);
    return getToken ?? "";
  }

  static Future<bool> setFCMToken(String fcmToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isTrue = await preferences.setString('fcm', fcmToken);

    return isTrue;
  }

  Future<String> getFCMToken() async {
    _prefs = await SharedPreferences.getInstance();
    String? fcm = _prefs!.getString('fcm');
    debugPrint("fcm $fcm");
    return fcm!;
  }

  static Future<bool> setBadgeStatus(bool badge) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = await prefs.setBool('badgeStatus', badge);
    return status;
  }

  getBadgStatus() async {
    _prefs = await SharedPreferences.getInstance();
    bool? status = _prefs?.getBool('badgeStatus');

    return status ?? false;
  }

  Future<bool> setConsent(bool? value) async {
    _prefs = await SharedPreferences.getInstance();
    bool consent = await _prefs!.setBool('consent', value!);
    return consent;
  }

  Future<bool> getConsent() async {
    _prefs = await SharedPreferences.getInstance();
    bool? userConsent = _prefs!.getBool("consent");
    return userConsent ?? false;
  }

  Future<bool?> setUserDetails(String? value) async {
    _prefs = await SharedPreferences.getInstance();
    bool? userData = await _prefs!.setString("userDetails", value!);
    debugPrint("valuSaved $userData");

    return userData;
  }

  Future<String> getUserDetails() async {
    _prefs = await SharedPreferences.getInstance();
    String? user = _prefs!.getString("userDetails");
    // print('Userrrr $user');
    return user ?? "";
  }

  Future<bool> clearData() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs!.clear();
    return true;
  }
}
