class PrescribtionStatus {
  String? msg;
  String? status;
  Prescribtion? prescribtion;

  PrescribtionStatus({this.msg, this.status, this.prescribtion});

  PrescribtionStatus.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    prescribtion =
        json['data'] != null ? Prescribtion.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (prescribtion != null) {
      data['data'] = prescribtion!.toJson();
    }
    return data;
  }
}

class Prescribtion {
  String? sId;
  String? patientId;
  String? diagnosis;
  bool? isViewed;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? pdf;

  Prescribtion(
      {this.sId,
      this.patientId,
      this.diagnosis,
      this.isViewed,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.pdf});

  Prescribtion.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    patientId = json['patientId'];
    diagnosis = json['diagnosis'];
    isViewed = json['isViewed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    pdf = json['pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['patientId'] = patientId;
    data['diagnosis'] = diagnosis;
    data['isViewed'] = isViewed;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['pdf'] = pdf;
    return data;
  }
}
