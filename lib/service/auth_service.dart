import 'dart:convert';
import 'package:bp_treat/module/account/model/chagepassword_send_otp.dart';
import 'package:bp_treat/module/account/model/verify_otp.dart';
import 'package:bp_treat/module/auth/model/changepassword.dart';
import 'package:bp_treat/module/auth/model/register.dart';
import 'package:bp_treat/module/auth/model/send_otp.dart';
import 'package:bp_treat/module/auth/model/user.dart';
import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final Prefrence _prefs = Prefrence.instance;


  String base_url = 'https://api.houstonepilepsy.com/api';

  Future<User> loginUser(String email, String password) async {
    String fcmToken = _prefs.getFCMToken();
    debugPrint('fcmmm : $fcmToken');
    try {
      var url = Uri.parse("$base_url/login");

      Map<String, dynamic> body = {
        'email': email,
        'password': password,
        'fcmToken': fcmToken,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };
      http.Response response = await http
          .post(
        url,
        body: jsonEncode(body),
        headers: header,
      )
          .catchError((err) {
        debugPrint("Error in catch Error : $err");
      });
      debugPrint('Body : $body');
      if (response.statusCode == 200 || response.statusCode == 400) {
        User user = User.fromJson(jsonDecode(response.body));
        debugPrint('loginBody : ${response.body}');
        return user;
      } else {
        throw Exception('Throwing Exception');
      }
    } catch (e) {
      debugPrint("Error ${e.toString()}");
      throw Exception(e);
    }
  }

  Future<SendOtp> sendOtpToEmail(String email) async {
    try {
      Uri url = Uri.parse("$base_url/sendOtp");
      Map<String, dynamic> body = {
        "email": email,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
        SendOtp otpData = SendOtp.fromJson(jsonDecode(response.body));
        debugPrint("otpData : ${otpData.msg}");
        return otpData;
      } else {
        return SendOtp();
      }
    } catch (e) {
      debugPrint("error ${e.toString()}");
      throw Exception(e);
    }
  }


  deleteAccount(id) async {
    try{
      Uri url = Uri.parse("https://api.houstonepilepsy.com/api/deletepatient");
      Map<String, dynamic> body = {
        "id": id,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body),headers: header);
   print("deleteAccountResponse -${response.statusCode}");
      if(response.statusCode == 200 || response.statusCode == 201){
        debugPrint("deleteAccount-${response.body}");
        bool isCleared = await _prefs.clearData();
        if(isCleared){
          Get.offAll(const LoginScreen());
        }
      }else{
        debugPrint("deleteAccount-${response.body}");
      }
    }catch(e){
 throw Exception(e);
    }
  }

  Future<Register> verifyOtpAndRegister({
    required String userEmail,
    required String userOTP,
    required String userPassword,
    required String userFcmToken,
    required String userName,
    required bool privacyConsent,
  }) async {
    try {
      debugPrint(userFcmToken);
      final Uri uri = Uri.parse("$base_url/register");
      Map<String, dynamic> body = {
        'email': userEmail,
        'otp': userOTP,
        'password': userPassword,
        'fcmToken': userFcmToken,
        'name': userName,
        'privacyPolicyConsent': privacyConsent,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };
      debugPrint("body $body");

      final http.Response response = await http
          .post(
        uri,
        body: jsonEncode(body),
        headers: header,
      )
          .catchError((err) {
        debugPrint("Err : $err");
      });

      if (response.statusCode == 200 || response.statusCode == 400) {
        debugPrint("Res : ${response.body}");
        Register registerData = Register.fromJson(jsonDecode(response.body));
        debugPrint("Data : ${registerData.data}");
        return registerData;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Exception : ${e.toString()}");
    }
  }

  sendOTPForChangePassword(String customerEmail) async {
    final Uri uri = Uri.parse("$base_url/forgot-password-send-otp");
    try {
      Map<String, dynamic> body = {'email': customerEmail};
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };
      final http.Response response =
          await http.post(uri, body: jsonEncode(body), headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        ChangePasswordSendOTP data =
            ChangePasswordSendOTP.fromJson(jsonDecode(response.body));
        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  changePassword({required String email, required String password}) async {
    try {
      var token = _prefs.getToken();
      Uri url = Uri.parse("$base_url/change-password");
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ChangePassword data =
            ChangePassword.fromJson(jsonDecode(response.body));
        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  verifyOTPChangePass(
    String customerEmail,
    String customerOTP,
  ) async {
    final Uri uri = Uri.parse("$base_url/forgot-password-verify-otp");
    try {
      Map<String, dynamic> body = {
        'email': customerEmail,
        'otp': customerOTP,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };
      final http.Response response =
          await http.post(uri, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        VerifyOTP verifyOTP = VerifyOTP.fromJson(jsonDecode(response.body));
        return verifyOTP;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future userLogout() async {
    var token = _prefs.getToken();
    Uri url = Uri.parse("$base_url/logout");
    try {
      Map<String, String> header = {
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.post(url, headers: header).catchError((err) {
        debugPrint(err);
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> user = json.decode(response.body);
        return user;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
