class UserDetail {
  String? msg;
  String? status;
  Data? data;

  UserDetail({this.msg, this.status, this.data});

  UserDetail.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? mobile;
  String? email;
  String? gender;
  String? state;
  int? zipcode;
  String? dob;
  dynamic height;
  dynamic weight;
  bool? consultationConsent;
  String? notificationTime;

  Data(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.gender,
      this.state,
      this.zipcode,
      this.dob,
      this.height,
      this.weight,
      this.consultationConsent,
      this.notificationTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
    state = json['state'];
    zipcode = json['zipcode'];
    dob = json['dob'];
    height = json['height'];
    weight = json['weight'];
    consultationConsent = json['consultationConsent'];
    notificationTime = json['notificationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['gender'] = gender;
    data['state'] = state;
    data['zipcode'] = zipcode;
    data['dob'] = dob;
    data['height'] = height;
    data['weight'] = weight;
    data['consultationConsent'] = consultationConsent;
    data['notificationTime'] = notificationTime;
    return data;
  }
}
