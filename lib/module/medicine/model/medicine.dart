class MedicineReport {
  String? msg;
  String? status;
  List<Report>? report;

  MedicineReport({this.msg, this.status, this.report});

  MedicineReport.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    if (json['data'] != null) {
      report = <Report>[];
      json['data'].forEach((v) {
        report!.add(Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (report != null) {
      data['data'] = report!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Report {
  String? sId;
  String? patientId;
  String? doctorId;
  List<Medicines>? medicines;
  List<String>? sideEffect;
  String? pdf;
  bool? isViewed;
  bool? isActive;
  bool? doctorApproved;
  bool? rejected;
  bool? notificationSent;
  String? createdAt;
  String? updatedAt;
  int? iV;
  PdfData? pdfData;

  Report(
      {this.sId,
      this.patientId,
      this.doctorId,
      this.medicines,
      this.sideEffect,
      this.pdf,
      this.isViewed,
      this.isActive,
      this.doctorApproved,
      this.rejected,
      this.notificationSent,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.pdfData});

  Report.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
    sideEffect = json['sideEffect'].cast<String>();
    pdf = json['pdf'];
    isViewed = json['isViewed'];
    isActive = json['isActive'];
    doctorApproved = json['doctorApproved'];
    rejected = json['rejected'];
    notificationSent = json['notificationSent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    pdfData =
        json['pdfData'] != null ? PdfData.fromJson(json['pdfData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['patientId'] = patientId;
    data['doctorId'] = doctorId;
    if (medicines != null) {
      data['medicines'] = medicines!.map((v) => v.toJson()).toList();
    }
    data['sideEffect'] = sideEffect;
    data['pdf'] = pdf;
    data['isViewed'] = isViewed;
    data['isActive'] = isActive;
    data['doctorApproved'] = doctorApproved;
    data['rejected'] = rejected;
    data['notificationSent'] = notificationSent;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (pdfData != null) {
      data['pdfData'] = pdfData!.toJson();
    }
    return data;
  }
}

class Medicines {
  String? name;
  String? dosage;
  String? frequency;
  String? timePeriod;
  String? refill;
  String? sId;
  bool? isActive;

  Medicines(
      {this.name,
      this.dosage,
      this.frequency,
      this.timePeriod,
      this.refill,
      this.sId,
      this.isActive});

  Medicines.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dosage = json['dosage'];
    frequency = json['frequency'];
    timePeriod = json['timePeriod'];
    refill = json['refill'];
    sId = json['_id'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dosage'] = dosage;
    data['frequency'] = frequency;
    data['timePeriod'] = timePeriod;
    data['refill'] = refill;
    data['_id'] = sId;
    data['isActive'] = isActive;
    return data;
  }
}

class PdfData {
  String? type;
  List<int>? data;

  PdfData({this.type, this.data});

  PdfData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['data'] = this.data;
    return data;
  }
}
