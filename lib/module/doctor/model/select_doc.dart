
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
  Null? zipcode;
  String? email;
  Null? consultationConsent;
  bool? privacyPolicyConsent;
  String? notificationTime;
  String? fcmToken;
  String? loginToken;
  String? name;
  String? mobile;
  Null? state;
  DoctorId? doctorId;

  Data(
      {this.sId,
        this.zipcode,
        this.email,
        this.consultationConsent,
        this.privacyPolicyConsent,
        this.notificationTime,
        this.fcmToken,
        this.loginToken,
        this.name,
        this.mobile,
        this.state,
        this.doctorId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    zipcode = json['zipcode'];
    email = json['email'];
    consultationConsent = json['consultationConsent'];
    privacyPolicyConsent = json['privacyPolicyConsent'];
    notificationTime = json['notificationTime'];
    fcmToken = json['fcmToken'];
    loginToken = json['loginToken'];
    name = json['name'];
    mobile = json['mobile'];
    state = json['state'];
    doctorId = json['doctorId'] != null
        ? DoctorId.fromJson(json['doctorId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['zipcode'] = zipcode;
    data['email'] = email;
    data['consultationConsent'] = consultationConsent;
    data['privacyPolicyConsent'] = privacyPolicyConsent;
    data['notificationTime'] = notificationTime;
    data['fcmToken'] = fcmToken;
    data['loginToken'] = loginToken;
    data['name'] = name;
    data['mobile'] = mobile;
    data['state'] = state;
    if (doctorId != null) {
      data['doctorId'] = doctorId!.toJson();
    }
    return data;
  }
}

class DoctorId {
  String? sId;
  String? fname;
  String? lname;
  String? email;
  String? role;
  String? contact;

  DoctorId(
      {this.sId, this.fname, this.lname, this.email, this.role, this.contact});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    role = json['role'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fname'] = fname;
    data['lname'] = lname;
    data['email'] = email;
    data['role'] = role;
    data['contact'] = contact;
    return data;
  }
}
