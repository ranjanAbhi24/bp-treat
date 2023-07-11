class AddConsent {
  String? msg;
  String? status;
  Consent? consent;

  AddConsent({this.msg, this.status, this.consent});

  AddConsent.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    consent = json['data'] != null ? Consent.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (consent != null) {
      data['data'] = consent!.toJson();
    }
    return data;
  }
}

class Consent {
  String? sId;
  int? zipcode;
  String? email;
  bool? consultationConsent;
  bool? privacyPolicyConsent;
  String? notificationTime;
  String? fcmToken;
  String? loginToken;
  String? name;
  DoctorId? doctorId;
  String? mobile;
  String? state;

  Consent(
      {this.sId,
      this.zipcode,
      this.email,
      this.consultationConsent,
      this.privacyPolicyConsent,
      this.notificationTime,
      this.fcmToken,
      this.loginToken,
      this.name,
      this.doctorId,
      this.mobile,
      this.state});

  Consent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    zipcode = json['zipcode'];
    email = json['email'];
    consultationConsent = json['consultationConsent'];
    privacyPolicyConsent = json['privacyPolicyConsent'];
    notificationTime = json['notificationTime'];
    fcmToken = json['fcmToken'];
    loginToken = json['loginToken'];
    name = json['name'];
    doctorId =
        json['doctorId'] != null ? DoctorId.fromJson(json['doctorId']) : null;
    mobile = json['mobile'];
    state = json['state'];
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
    if (doctorId != null) {
      data['doctorId'] = doctorId!.toJson();
    }
    data['mobile'] = mobile;
    data['state'] = state;
    return data;
  }
}

class DoctorId {
  String? sId;
  String? fname;
  String? lname;
  String? contact;

  DoctorId({this.sId, this.fname, this.lname, this.contact});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fname = json['fname'];
    lname = json['lname'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fname'] = fname;
    data['lname'] = lname;
    data['contact'] = contact;
    return data;
  }
}
