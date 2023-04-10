class AddConsent {
  String? msg;
  String? status;
  Consent? consent;

  AddConsent({this.msg, this.status, this.consent});

  AddConsent.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    consent = json['data'] != null ? Consent.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (consent != null) {
      data['data'] = consent!.toJson();
    }
    return data;
  }
}

class Consent {
  String? sId;
  String? gender;
  String? dob;
  List<String>? diseases;
  int? iV;
  bool? consultationConsent;
  String? alcohol;
  String? allergies;
  bool? amphetamine;
  bool? diabetes;
  dynamic height;
  bool? heroin;
  bool? marijuana;
  String? medication;
  bool? narcotics;
  String? otherDiseases;
  bool? smoker;
  dynamic weight;
  dynamic albumin;
  dynamic calcium;
  dynamic creatinine;
  dynamic hematocrit;
  dynamic tsh;

  Consent({
    this.sId,
    this.gender,
    this.dob,
    this.diseases,
    this.iV,
    this.consultationConsent,
    this.alcohol,
    this.allergies,
    this.amphetamine,
    this.diabetes,
    this.height,
    this.heroin,
    this.marijuana,
    this.medication,
    this.narcotics,
    this.otherDiseases,
    this.smoker,
    this.weight,
    this.albumin,
    this.calcium,
    this.creatinine,
    this.hematocrit,
    this.tsh,
  });

  Consent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    gender = json['gender'];
    dob = json['dob'];
    diseases = json['diseases'].cast<String>();
    iV = json['__v'];
    consultationConsent = json['consultationConsent'];
    alcohol = json['alcohol'];
    allergies = json['allergies'];
    amphetamine = json['amphetamine'];
    diabetes = json['diabetes'];
    height = json['height'];
    heroin = json['heroin'];
    marijuana = json['marijuana'];
    medication = json['medication'];
    narcotics = json['narcotics'];
    otherDiseases = json['otherDiseases'];
    smoker = json['smoker'];
    weight = json['weight'];
    albumin = json['albumin'];
    calcium = json['calcium'];
    creatinine = json['creatinine'];
    hematocrit = json['hematocrit'];
    tsh = json['tsh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['gender'] = gender;
    data['dob'] = dob;
    data['diseases'] = diseases;
    data['__v'] = iV;
    data['consultationConsent'] = consultationConsent;
    data['alcohol'] = alcohol;
    data['allergies'] = allergies;
    data['amphetamine'] = amphetamine;
    data['diabetes'] = diabetes;
    data['height'] = height;
    data['heroin'] = heroin;
    data['marijuana'] = marijuana;
    data['medication'] = medication;
    data['narcotics'] = narcotics;
    data['otherDiseases'] = otherDiseases;
    data['smoker'] = smoker;
    data['weight'] = weight;
    data['albumin'] = albumin;
    data['calcium'] = calcium;
    data['creatinine'] = creatinine;
    data['hematocrit'] = hematocrit;
    data['tsh'] = tsh;
    return data;
  }
}
