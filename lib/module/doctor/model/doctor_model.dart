class DoctorModel {
  String? msg;
  String? status;
  List<Doctor>? docotr;

  DoctorModel({this.msg, this.status, this.docotr});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['data'] != null) {
      docotr = <Doctor>[];
      json['data'].forEach((v) {
        docotr!.add(Doctor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (docotr != null) {
      data['data'] = docotr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctor {
  String? sId;
  String? fname;
  String? lname;
  String? address;
  String? role;
  String? email;
  String? contact;
  String? state;
  dynamic zipcode;

  Doctor(
      {this.sId,
      this.fname,
      this.lname,
      this.address,
      this.role,
      this.email,
      this.contact,
      this.state,
      this.zipcode});

  Doctor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fname = json['fname'];
    lname = json['lname'];
    address = json['address'];
    role = json['role'];
    email = json['email'];
    contact = json['contact'];
    state = json['state'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fname'] = fname;
    data['lname'] = lname;
    data['address'] = address;
    data['role'] = role;
    data['email'] = email;
    data['contact'] = contact;
    data['state'] = state;
    data['zipcode'] = zipcode;
    return data;
  }
}
