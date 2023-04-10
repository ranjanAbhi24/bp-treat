class HealthDetail {
  String? msg;
  String? status;
  Health? health;

  HealthDetail({this.msg, this.status, this.health});

  HealthDetail.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    health = json['data'] != null ? Health.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (health != null) {
      data['data'] = health!.toJson();
    }
    return data;
  }
}

class Health {
  String? sId;

  bool? diabetes;
  dynamic hematocrit;
  dynamic creatinine;
  dynamic calcium;
  dynamic albumin;
  dynamic tsh;
  bool? smoker;
  bool? marijuana;
  bool? amphetamine;
  bool? heroin;
  bool? narcotics;
  String? alcohol;

  String? allergies;
  String? medication;
  String? otherDiseases;

  int? iV;

  Health({
    this.sId,
    this.diabetes,
    this.hematocrit,
    this.creatinine,
    this.calcium,
    this.albumin,
    this.tsh,
    this.smoker,
    this.marijuana,
    this.amphetamine,
    this.heroin,
    this.narcotics,
    this.alcohol,
    this.allergies,
    this.medication,
    this.otherDiseases,
    this.iV,
  });

  Health.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];

    diabetes = json['diabetes'];
    hematocrit = json['hematocrit'];
    creatinine = json['creatinine'];
    calcium = json['calcium'];
    albumin = json['albumin'];
    tsh = json['tsh'];
    smoker = json['smoker'];
    marijuana = json['marijuana'];
    amphetamine = json['amphetamine'];
    heroin = json['heroin'];
    narcotics = json['narcotics'];
    alcohol = json['alcohol'];

    allergies = json['allergies'];
    medication = json['medication'];
    otherDiseases = json['otherDiseases'];

    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;

    data['diabetes'] = diabetes;
    data['hematocrit'] = hematocrit;
    data['creatinine'] = creatinine;
    data['calcium'] = calcium;
    data['albumin'] = albumin;
    data['tsh'] = tsh;
    data['smoker'] = smoker;
    data['marijuana'] = marijuana;
    data['amphetamine'] = amphetamine;
    data['heroin'] = heroin;
    data['narcotics'] = narcotics;
    data['alcohol'] = alcohol;

    data['allergies'] = allergies;
    data['medication'] = medication;

    data['otherDiseases'] = otherDiseases;

    data['__v'] = iV;

    return data;
  }
}
