class ContactDoctor {
  String? msg;
  String? status;
  Data? data;

  ContactDoctor({this.msg, this.status, this.data});

  ContactDoctor.fromJson(Map<String, dynamic> json) {
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
  String? doctorId;
  String? medication;
  String? sideEffet;
  String? medicationAllergy;
  String? other;
  String? description;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.patientId,
        this.doctorId,
        this.medication,
        this.sideEffet,
        this.medicationAllergy,
        this.other,
        this.description,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    medication = json['medication'];
    sideEffet = json['sideEffet'];
    medicationAllergy = json['medicationAllergy'];
    other = json['other'];
    description = json['description'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['doctorId'] = doctorId;
    data['medication'] = medication;
    data['sideEffet'] = sideEffet;
    data['medicationAllergy'] = medicationAllergy;
    data['other'] = other;
    data['description'] = description;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
