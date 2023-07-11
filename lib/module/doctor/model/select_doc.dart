class SelectDoctor {
  String? msg;
  String? status;
  Doc? data;

  SelectDoctor({this.msg, this.status, this.data});

  SelectDoctor.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = json['data'] != null ? Doc.fromJson(json['data']) : null;
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

class Doc {
  DoctorId? doctorId;

  Doc({
    this.doctorId,
  });

  Doc.fromJson(Map<String, dynamic> json) {
    doctorId =
        json['doctorId'] != null ? DoctorId.fromJson(json['doctorId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
