import 'dart:convert';
import 'package:bp_treat/module/account/model/faq.dart';
import 'package:bp_treat/module/account/model/health_detail.dart';
import 'package:bp_treat/module/account/model/update_user.dart';
import 'package:bp_treat/module/account/model/user_detail.dart';
import 'package:bp_treat/module/consult/model/add_consent.dart';
import 'package:bp_treat/module/consult/model/get_disease.dart';
import 'package:bp_treat/module/contact/model/change_prescription.dart';
import 'package:bp_treat/module/contact/model/post_med.dart';
import 'package:bp_treat/module/dashboard/model/add_record.dart';
import 'package:bp_treat/module/dashboard/model/all_record.dart';
import 'package:bp_treat/module/dashboard/model/graph.dart';
import 'package:bp_treat/module/dashboard/model/notification.dart';
import 'package:bp_treat/module/dashboard/model/user_record.dart';
import 'package:bp_treat/module/doctor/model/doctor_model.dart';
import 'package:bp_treat/module/doctor/model/select_doc.dart';
import 'package:bp_treat/module/medicine/model/medicine.dart';
import 'package:bp_treat/module/medicine/model/prescribtion_status.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Prefrence prefs = Prefrence();
  // String base_url = 'http://3.109.121.178:8080/api';

  // String base_url = 'http://54.238.218.186:5000/api';
  String base_url = 'https://api.houstonepilepsy.com/api';

  Future<UserDetail> getUserDetails() async {
    var token = await prefs.getToken();
    debugPrint("token : $token");
    try {
      Uri url = Uri.parse("$base_url/get-basic-details");

      Map<String, String> header = {
        "Content-type": 'application/json',
        "Accept": 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };

      http.Response response = await http.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserDetail userDetails = UserDetail.fromJson(jsonDecode(response.body));

        return userDetails;
      } else {
        debugPrint('else block');
        return UserDetail();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<UserRecord> getUserRecord(String patientID) async {
    var token = await prefs.getToken();
    try {
      Uri url = Uri.parse("$base_url/get-record?patientId=$patientID");

      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };

      http.Response response =
          await http.get(url, headers: header).catchError((err) {
        debugPrint("error :$err");
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        UserRecord record = UserRecord.fromJson(jsonDecode(response.body));
        return record;
      } else {
        return UserRecord();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  postUserRecord(int systolic, int diastolic, int pulse, String note) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse("$base_url/add-record");
    try {
      Map<String, dynamic> body = {
        "systolic": systolic,
        "diastolic": diastolic,
        "pulse": pulse,
        "note": note,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.post(url, headers: header, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        AddRecord addRecord = AddRecord.fromJson(jsonDecode(response.body));
        return addRecord;
      }
    } catch (e) {
      debugPrint(e.toString());
      return e;
    }
  }

  getDisease() async {
    try {
      Uri url = Uri.parse('$base_url/get-disease');
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        GetDisease disease = GetDisease.fromJson(jsonDecode(response.body));
        return disease;
      }
    } catch (e) {
      throw Error();
    }
  }

  updateUserRecord({dynamic weight, String? time}) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse("$base_url/update-patient-details");
    try {
      Map<String, dynamic> body = {"weight": weight, "notificationTime": time};

      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };

      http.Response response = await http
          .post(url, headers: header, body: jsonEncode(body))
          .catchError((err) {
        debugPrint("err : $err");
      });
      debugPrint("body : $body");

      if (response.statusCode == 200 || response.statusCode == 201) {
        UpdatedUser newData = UpdatedUser.fromJson(jsonDecode(response.body));
        debugPrint("NewData : $newData");
        return newData;
      }
    } catch (e) {
      debugPrint("catch Errorrrr : ${e.toString()}");
    }
  }

  updatePatientDetail({
    bool? isDiabetic,
    String? otherDisease,
    String? medication,
    String? allergic,
    dynamic hematocrit,
    dynamic creatanine,
    dynamic calcium,
    dynamic albumin,
    dynamic tsh,
    bool? isNarcotics,
    String? alcoholic,
    bool? isAmphetamine,
    bool? isHeroine,
    bool? isSmoker,
    bool? isWeedUser,
  }) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse("$base_url/update-patient-details");
    try {
      Map<String, dynamic> body = {
        "amphetamine": isAmphetamine,
        "heroin": isHeroine,
        "narcotics": isNarcotics,
        "alcohol": alcoholic,
        "creatinine": creatanine,
        "calcium": calcium,
        "albumin": albumin,
        "tsh": tsh,
        "hematocrit": hematocrit,
        "diabetes": isDiabetic,
        "medication": medication,
        "otherDiseases": otherDisease,
        "allergies": allergic,
        "smoker": isSmoker,
        "marijuana": isWeedUser,
      };

      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };

      http.Response response = await http
          .post(url, headers: header, body: jsonEncode(body))
          .catchError((err) {
        debugPrint("err : $err");
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        HealthDetail healthDetail =
            HealthDetail.fromJson(jsonDecode(response.body));
        debugPrint('healthDetail : $healthDetail');
        return healthDetail;
      }
    } catch (e) {
      debugPrint("catch Errorrrr : ${e.toString()}");
    }
  }

  getNotification(String patientID) async {
    var token = await prefs.getToken();
    try {
      Uri url =
          Uri.parse("$base_url/get-user-notifications?patientId=$patientID");
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.get(url, headers: header).catchError((err) {
        debugPrint(err);
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserNotification userNotification =
            UserNotification.fromJson(jsonDecode(response.body));
        return userNotification;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getPatientDetail() async {
    var token = await prefs.getToken();
    try {
      Uri url = Uri.parse("$base_url/get-patient-details");
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.get(url, headers: header).catchError((err) {
        debugPrint(err);
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        HealthDetail patientDetails =
            HealthDetail.fromJson(jsonDecode(response.body));

        return patientDetails;
      }
    } catch (e) {
      debugPrint("Catch kro : ${e.toString()}");
    }
  }

  addPatientConsent({
    String? dateOfBirth,
    String? gender,
    dynamic height,
    dynamic weight,
    bool? isDiabetic,
    dynamic tsh,
    String? medication,
    String? allergies,
    String? otherDisease,
    dynamic hematocrit,
    dynamic creatinine,
    dynamic calcium,
    dynamic albumin,
    bool? isSmoker,
    bool? isMarijuana,
    bool? isAmphetamine,
    bool? isNarcotics,
    String? alcohol,
    bool? isHeroine,
    bool? isConsent,
    String? mobile,
    String? state,
    int? zipcode,
  }) async {
    var token = await prefs.getToken();
    try {
      Uri url = Uri.parse("$base_url/add-patient-details");
      Map<String, dynamic> body = {
        "gender": gender,
        "height": height,
        "weight": weight,
        "diabetes": isDiabetic,
        "hematocrit": hematocrit,
        "creatinine": creatinine,
        "calcium": calcium,
        "albumin": albumin,
        "tsh": tsh,
        "smoker": isSmoker,
        "marijuana": isMarijuana,
        "amphetamine": isAmphetamine,
        "heroin": isHeroine,
        "narcotics": isNarcotics,
        "alcohol": alcohol,
        "dob": dateOfBirth,
        "allergies": allergies,
        "medication": medication,
        "otherDiseases": otherDisease,
        "consultationConsent": isConsent,
        "mobile": mobile,
        "state": state,
        "zip": zipcode,
      };
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      debugPrint("Header : $header");
      http.Response response = await http
          .post(url, body: jsonEncode(body), headers: header)
          .catchError((err) {
        debugPrint("Err : $err");
      });
      debugPrint('Res : ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Response : ${response.body}');

        AddConsent patientConsent =
            AddConsent.fromJson(jsonDecode(response.body));
        return patientConsent;
      }
    } catch (e) {
      debugPrint("Catch Error : ${e.toString()}");
    }
  }

  fetchGraph(String hour, String patientID) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse(
        "$base_url/get-graph-data?interval=$hour&patientId=$patientID");
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.post(url, headers: header).catchError((err) {
        debugPrint("err $err");
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        GraphModel graphModel = GraphModel.fromJson(jsonDecode(response.body));
        return graphModel;
      }
    } catch (e) {
      debugPrint("catch Error : ${e.toString()}");
    }
  }

  fetchFAQ() async {
    Uri url = Uri.parse("$base_url/get-faq");
    try {
      http.Response response = await http.get(url).catchError((err) {
        debugPrint(err);
      });

      if (response.statusCode == 200) {
        FAQ faq = FAQ.fromJson(jsonDecode(response.body));
        return faq;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  fetchPrescribtion(String patientID) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse("$base_url/get-user-prescription?patientId=$patientID");
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.get(url, headers: header).catchError((err) {
        debugPrint(err);
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        MedicineReport report =
            MedicineReport.fromJson(jsonDecode(response.body));
        return report;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  changePrescriptionStatus(String prescriptionId) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse(
        '$base_url/prescription-viewed?prescriptionId=$prescriptionId');
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };

      http.Response response =
          await http.post(url, headers: header).catchError((err) {
        debugPrint(err);
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        PrescribtionStatus status =
            PrescribtionStatus.fromJson(jsonDecode(response.body));
        return status;
      }
    } catch (e) {
      debugPrint("catch error $e");
    }
  }

  viewAllRecord({required String patientID, required String intervals}) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse(
        '$base_url/get-all-records?patientId=$patientID&interval=$intervals');

    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.get(url, headers: header).catchError((err) {
        debugPrint(err);
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        AllRecord allRecord = AllRecord.fromJson(jsonDecode(response.body));
        return allRecord;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<DoctorModel> fetchDoctorList() async {
    var token = await prefs.getToken();
    Uri url = Uri.parse('$base_url/get-doctor');

    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      http.Response response =
          await http.get(url, headers: header).catchError((err) {
        debugPrint(err);
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        DoctorModel doctorModel =
            DoctorModel.fromJson(jsonDecode(response.body));

        return doctorModel;
      } else {
        return DoctorModel();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  selectDoctor({required String doctorID, required String role}) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse('$base_url/select-doctor');
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      Map<String, dynamic> body = {'doctorId': doctorID, 'role': role};
      http.Response response = await http.post(
        url,
        headers: header,
        body: jsonEncode(body),
      );
      debugPrint("Body : $body");
      if (response.statusCode == 200 || response.statusCode == 201) {
        SelectDoctor docRes = SelectDoctor.fromJson(jsonDecode(response.body));
        return docRes;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ChangePrescription> listMedicineForChange() async {
    var token = await prefs.getToken();
    Uri url = Uri.parse('$base_url/get-latest-prescription');
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };

      http.Response response = await http.get(
        url,
        headers: header,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ChangePrescription changePrescription =
            ChangePrescription.fromJson(jsonDecode(response.body));
        return changePrescription;
      } else {
        return ChangePrescription();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  postMedicineForChange({
    String? prescriptionID,
    String? doctorID,
    List? medicine,
    String? otherIssue,
  }) async {
    var token = await prefs.getToken();
    Uri url = Uri.parse('$base_url/save-side-effect');
    try {
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Authorization": 'Bearer $token',
      };
      Map<String, dynamic> body = {
        "prescriptionId": prescriptionID,
        "doctorId": doctorID,
        "medicine": medicine,
        "description": otherIssue,
      };

      http.Response response = await http
          .post(url, body: jsonEncode(body), headers: header)
          .catchError((err) {
        print("ERR : $err");
      });
      print("Body : $body");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Response: ${response.body}");
        PostMed postMed = PostMed.fromJson(jsonDecode(response.body));
        return postMed;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
