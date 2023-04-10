class UpdatedUser {
  String? msg;
  String? status;
  Data? data;

  UpdatedUser({this.msg, this.status, this.data});

  UpdatedUser.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? email;
  String? gender;
  String? dob;
  String? mobile;
  String? name;
  String? state;
  dynamic zipcode;
  dynamic height;
  dynamic weight;
  String? notificationTime;

  Data({
    this.sId,
    this.username,
    this.email,
    this.gender,
    this.dob,
    this.mobile,
    this.name,
    this.state,
    this.zipcode,
    this.height,
    this.weight,
    this.notificationTime,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    mobile = json['mobile'];
    name = json['name'];
    state = json['state'];
    zipcode = json['zipcode'];
    height = json['height'];
    weight = json['weight'];
    notificationTime = json['notificationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['_id'] = sId;
    data['username'] = username;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['mobile'] = mobile;
    data['name'] = name;
    data['state'] = state;
    data['zipcode'] = zipcode;
    data['height'] = height;
    data['weight'] = weight;
    data['notificationTime'] = notificationTime;
    return data;
  }
}
