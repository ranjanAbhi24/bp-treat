class ChangePasswordSendOTP {
  String? msg;
  String? status;
  Data? data;

  ChangePasswordSendOTP({this.msg, this.status, this.data});

  ChangePasswordSendOTP.fromJson(Map<String, dynamic> json) {
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
  String? otp;
  bool? isEmailVerified;

  Data({this.sId, this.email, this.otp, this.isEmailVerified});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    otp = json['otp'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['otp'] = otp;
    data['isEmailVerified'] = isEmailVerified;
    return data;
  }
}
