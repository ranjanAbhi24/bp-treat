class PostMed {
  String? msg;
  String? status;
  Data? data;

  PostMed({this.msg, this.status, this.data});

  PostMed.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? body;
  String? prescriptionId;
  String? patientId;
  String? doctorId;
  String? description;

  Data(
      {this.title,
      this.body,
      this.prescriptionId,
      this.patientId,
      this.doctorId,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    prescriptionId = json['prescriptionId'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['prescriptionId'] = prescriptionId;
    data['patientId'] = patientId;
    data['doctorId'] = doctorId;
    data['description'] = description;
    return data;
  }
}
