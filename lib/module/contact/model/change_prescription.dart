class ChangePrescription {
  String? msg;
  String? status;
  Data? data;

  ChangePrescription({this.msg, this.status, this.data});

  ChangePrescription.fromJson(Map<String, dynamic> json) {
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
  String? prescriptionId;
  String? title;
  List<Medicine>? medicine;

  Data({this.prescriptionId, this.title, this.medicine});

  Data.fromJson(Map<String, dynamic> json) {
    prescriptionId = json['prescriptionId'];
    title = json['title'];
    if (json['medicine'] != null) {
      medicine = <Medicine>[];
      json['medicine'].forEach((v) {
        medicine!.add(Medicine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prescriptionId'] = prescriptionId;
    data['title'] = title;
    if (medicine != null) {
      data['medicine'] = medicine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicine {
  String? name;
  String? dosage;
  String? frequency;
  String? timePeriod;
  String? refill;
  String? sId;

  Medicine(
      {this.name,
      this.dosage,
      this.frequency,
      this.timePeriod,
      this.refill,
      this.sId});

  Medicine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dosage = json['dosage'];
    frequency = json['frequency'];
    timePeriod = json['timePeriod'];
    refill = json['refill'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dosage'] = dosage;
    data['frequency'] = frequency;
    data['timePeriod'] = timePeriod;
    data['refill'] = refill;
    data['_id'] = sId;
    return data;
  }
}
