class AddRecord {
  String? msg;
  String? status;
  Data? data;

  AddRecord({this.msg, this.status, this.data});

  AddRecord.fromJson(Map<String, dynamic> json) {
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
  String? patientId;
  int? systolic;
  int? diastolic;
  int? pulse;
  String? note;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.patientId,
      this.systolic,
      this.diastolic,
      this.pulse,
      this.note,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    systolic = json['systolic'];
    diastolic = json['diastolic'];
    pulse = json['pulse'];
    note = json['note'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['systolic'] = systolic;
    data['diastolic'] = diastolic;
    data['pulse'] = pulse;
    data['note'] = note;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
