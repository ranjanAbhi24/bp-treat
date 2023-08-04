
class SelectDoctor {
  String? msg;
  String? status;
  Data? data;

  SelectDoctor({this.msg, this.status, this.data});

  SelectDoctor.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  Null? consultationConsent;
  bool? privacyPolicyConsent;
  String? notificationTime;
  String? fcmToken;
  String? loginToken;
  String? name;
  DoctorId? doctorId;
  String? mobile;
  Null? state;
  int? zipcode;

  Data(
      {this.sId,
        this.email,
        this.consultationConsent,
        this.privacyPolicyConsent,
        this.notificationTime,
        this.fcmToken,
        this.loginToken,
        this.name,
        this.doctorId,
        this.mobile,
        this.state,
        this.zipcode});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    consultationConsent = json['consultationConsent'];
    privacyPolicyConsent = json['privacyPolicyConsent'];
    notificationTime = json['notificationTime'];
    fcmToken = json['fcmToken'];
    loginToken = json['loginToken'];
    name = json['name'];
    doctorId = json['doctorId'] != null
        ? DoctorId.fromJson(json['doctorId'])
        : null;
    mobile = json['mobile'];
    state = json['state'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['consultationConsent'] = consultationConsent;
    data['privacyPolicyConsent'] = privacyPolicyConsent;
    data['notificationTime'] = notificationTime;
    data['fcmToken'] = fcmToken;
    data['loginToken'] = loginToken;
    data['name'] = name;
    if (doctorId != null) {
      data['doctorId'] = doctorId!.toJson();
    }
    data['mobile'] = mobile;
    data['state'] = state;
    data['zipcode'] = zipcode;
    return data;
  }
}

class DoctorId {
  String? sId;
  String? fname;
  String? lname;
  String? email;
  String? contact;
  String? role;

  DoctorId(
      {this.sId, this.fname, this.lname, this.email, this.contact, this.role});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    contact = json['contact'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fname'] = fname;
    data['lname'] = lname;
    data['email'] = email;
    data['contact'] = contact;
    data['role'] = role;
    return data;
  }
}
